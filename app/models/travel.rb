class Travel < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :travel_impression, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user)
    favorites.where(user_id: user).exists?
  end

  with_options presence: true do
    validates :transportation_id, numericality: { other_than: 1 } 
    validates :destination_id, numericality: { other_than: 1 } 
    validates :travel_time_one
    validates :travel_time_two
    validates :travel_title
    validates :image
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :destination
  belongs_to :transportation
  

  
end
