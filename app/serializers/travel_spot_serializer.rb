class TravelSpotSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :genre_id, :name, :rating, :is_new, :images,
             :postcode, :prefecture_code, :address_city, :address_street, :address_building,
             :full_address, :introduction, :access, :created_at, :updated_at,
             :phone_number, :business_hour, :parking, :home_page, :latitude, :longitude

  belongs_to :user, serializer: UserSerializer
  belongs_to :genre, serializer: GenreSerializer
  has_many :favorites, serializer: FavoriteSerializer
  has_many :favorited_users, through: :favorites, source: :user
  has_many :reviews, serializer: ReviewSerializer
end
