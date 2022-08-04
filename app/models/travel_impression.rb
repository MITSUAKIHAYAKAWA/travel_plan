class TravelImpression < ApplicationRecord
  has_many_attached :images, dependent: :destroy
  belongs_to :user
  belongs_to :travel

  validates :impression, presence: true
end
