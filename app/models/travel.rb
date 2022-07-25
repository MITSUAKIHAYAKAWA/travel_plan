class Travel < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  
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
  has_one :impression

  
end
