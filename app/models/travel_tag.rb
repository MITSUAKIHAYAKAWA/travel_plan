class TravelTag < ApplicationRecord
  belongs_to :travel
  belongs_to :tag

  validates :travel_id, presence: true
  validates :tag_id, presence: true
end
