class GenreSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :created_at, :updated_at

  has_many :travel_spots, serializer: TravelSpotSerializer
end
