class Travel < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :travel_impression, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :travel_tags, dependent: :destroy
  has_many :tags, through: :travel_tags, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user).exists?
  end

  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name: old)
    end

    new_tags.each do |new|
      new_travel_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_travel_tag
    end
  end

  with_options presence: true do
    validates :destination_id, numericality: { other_than: 1 }
    validates :travel_time_one
    validates :travel_time_two
    validates :travel_title
    validates :image
  end

  def self.looks(search, key_word)
    @travel = if search == 'perfect_match'
                Travel.where('travel_title LIKE?', "#{key_word}")
              elsif search == 'forward_match'
                Travel.where('travel_title LIKE?', "#{key_word}%")
              elsif search == 'backward_match'
                Travel.where('travel_title LIKE?', "%#{key_word}")
              elsif search == 'partial_match'
                Travel.where('travel_title LIKE?', "%#{key_word}%")
              else
                Travel.all
              end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :destination
  belongs_to :transportation
end
