class Tag < ApplicationRecord
  has_many :travel_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :travels, through: :travel_tags

  validates :tag_name, uniqueness: true, presence: true
end
