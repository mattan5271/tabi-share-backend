class Genre < ApplicationRecord
  has_many :travel_spots, dependent: :destroy

  validates :name, presence: true, length: { maximum: 20 }

  mount_uploader :image, ImageUploader
end
