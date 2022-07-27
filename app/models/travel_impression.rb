class TravelImpression < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  belongs_to :travel

  validates :impression, presence: true
end
