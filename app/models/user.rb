class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :name
    validates :password, on: :create
  end

  has_many :travels
  has_many :impressions
  has_many :favorites, dependent: :destroy
  has_one_attached :avatar

  def self.looks(search, key_word)
    @user = if search == 'perfect_match'
              User.where('nickname LIKE?', "#{key_word}")
            elsif search == 'forward_match'
              User.where('nickname LIKE?', "#{key_word}%")
            elsif search == 'backward_match'
              User.where('nickname LIKE?', "%#{key_word}")
            elsif search == 'partial_match'
              User.where('nickname LIKE?', "%#{key_word}%")
            else
              User.all
            end
  end
end
