class TravelSpot < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :reviews, dependent: :destroy

  validates :user_id, presence: true
  validates :genre_id, presence: true
  validates :name, presence: true, length: { maximum: 30 }
  validates :postcode, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
  validates :prefecture_code, presence: true
  validates :address_city, presence: true, length: { maximum: 50 }
  validates :address_street, presence: true, length: { maximum: 50 }
  validates :address_building, length: { maximum: 50 }
  validates :introduction, presence: true, length: { maximum: 400 }
  validates :access, presence: true, length: { maximum: 200 }
  validates :business_hour, presence: true, length: { maximum: 100 }
  validates :phone_number, presence: true, format: { with: /\A[0-9]{2,4}-[0-9]{2,4}-[0-9]{3,4}\z/ }
  validates :parking, presence: true, length: { maximum: 300 }
  validates :home_page, length: { maximum: 100 }

  mount_uploaders :images, ImageUploader

  include JpPrefecture
  jp_prefecture :prefecture_code

  geocoded_by :full_address_for_geocode
  after_validation :geocode

  def full_address_for_geocode
    address_city + address_street
  end

  # 住所を結合
  def full_address
    "〒#{postcode} #{prefecture_name} #{address_city} #{address_street} #{address_building}"
  end

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

  def rating
    reviews = self.reviews
    rating  = reviews.pluck(:rating).sum.fdiv(reviews.size)
    rating.nan? ? 0.0 : rating
  end

  def is_new
    created_at || Time.zone.now > 1.day.ago
  end

  class << self
    def sorting(travel_spots:, sort_value:)
      case sort_value
      when "recommend"
        travel_spots.sort { |a, b| b.rating <=> a.rating }
      when "new"
        travel_spots.order(created_at: "DESC")
      when "review"
        TravelSpot.find(
          Review.where(travel_spot_id: travel_spots.pluck(:id))
            .group(:travel_spot_id)
            .order("count(travel_spot_id) DESC")
            .pluck(:travel_spot_id)
        )
      when "favorite"
        TravelSpot.find(
          Favorite.where(travel_spot_id: travel_spots.pluck(:id))
            .group(:travel_spot_id)
            .order("count(travel_spot_id) DESC")
            .pluck(:travel_spot_id)
        )
      else
        travel_spots.sort { |a, b| b.rating <=> a.rating }
      end
    end
  end
end
