class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :name
  end

  has_many :travels
  has_many :impressions
  has_many :favorites, dependent: :destroy

  def self.looks(search, key_word)
    if search == "perfect_match"
      @user = User.where("nickname LIKE?", "#{key_word}")
    elsif search == "forward_match"
      @user = User.where("nickname LIKE?","#{key_word}%")
    elsif search == "backward_match"
      @user = User.where("nickname LIKE?","%#{key_word}")
    elsif search == "partial_match"
      @user = User.where("nickname LIKE?","%#{key_word}%")
    else
      @user = User.all
    end
  end
end
