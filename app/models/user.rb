class User < ApplicationRecord
  has_secure_password

  has_many :travel_spots, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_travel_spots, through: :favorites, source: :travel_spot
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy, inverse_of: :user
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy, inverse_of: :user
  has_many :followings, through: :follower, source: :followed
  has_many :followers, through: :followed, source: :follower

  validates :email, presence: true, format: { with: /\S+@\S+/ }
  validates :password_digest, presence: true, length: { minimum: 8 }
  validates :name, length: { maximum: 20 }
  validates :sex, numericality: { only_integer: true }
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 150 }
  validates :introduction, length: { maximum: 200 }

  extend Enumerize
  enumerize :sex, in: { "男性": 0, "女性": 1, "その他": 2 }

  mount_uploader :profile_image, ImageUploader

  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end
end
