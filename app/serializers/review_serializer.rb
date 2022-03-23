class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :travel_spot_id, :title, :body, :rating, :images, :created_at, :updated_at

  belongs_to :user, serializer: UserSerializer
  belongs_to :travel_spot, serializer: TravelSpotSerializer
end
