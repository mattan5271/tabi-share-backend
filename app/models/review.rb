class Review < ApplicationRecord
  belongs_to :user
  belongs_to :travel_spot

  validates :user_id, presence: true
  validates :travel_spot_id, presence: true
  validates :title, presence: true, length: { maximum: 30 }
  validates :body, presence: true, length: { maximum: 200 }

  mount_uploaders :images, ImageUploader
end
