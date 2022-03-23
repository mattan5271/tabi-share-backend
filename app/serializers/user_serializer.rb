class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password_digest, :name, :sex, :age, :introduction, :profile_image, :is_admin, :created_at, :updated_at

  has_many :travel_spots, serializer: TravelSpotSerializer
  has_many :reviews, serializer: ReviewSerializer
  has_many :favorites, serializer: FavoriteSerializer
  has_many :favorited_travel_spots, through: :favorites, source: :travel_spot
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :follower, source: :followed
  has_many :followers, through: :followed, source: :follower
end
