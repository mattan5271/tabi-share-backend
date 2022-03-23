class Api::TravelSpotsController < ApplicationController
  before_action :set_travel_spot, only: %i[show update destroy]

  def index
    # binding.pry
    travel_spots = TravelSpot.all
    travel_spots = travel_spots.where(genre_id: params[:genre_id]) if params[:genre_id].present?
    travel_spots = travel_spots.where(["name LIKE ?", "%#{params[:keyword]}%"]) if params[:keyword].present?
    travel_spots = travel_spots.sorting(travel_spots: travel_spots, sort_value: params[:sort]) if params[:sort].present?
    render json: travel_spots, include: %i[user genre favorites reviews], status: :ok
  end

  def show
    render json: @travel_spot, include: [:user, :genre, :favorites, { reviews: [:user] }], status: :ok
  end

  def create
    travel_spot = TravelSpot.new(travel_spot_params)
    staus = travel_spot.save ? :ok : :internal_server_error
    render json: travel_spot, status: staus
  end

  def update
    staus = @travel_spot.update(travel_spot_params) ? :ok : :internal_server_error
    render json: @travel_spot, status: staus
  end

  def destroy
    staus = @travel_spot.destroy ? :ok : :internal_server_error
    render json: @travel_spot, status: staus
  end

  def favorite
    favorite = current_user.favorites.new(travel_spot_id: params[:id])
    favorite.save
    render json: favorite, status: :ok
  end

  def unfavorite
    favorite = current_user.favorites.find_by(travel_spot_id: params[:id])
    favorite.destroy
    render json: favorite, status: :ok
  end

  def rate_ranking
    travel_spots = TravelSpot.all.sort { |a, b| b.rating <=> a.rating }
    render json: travel_spots, status: :ok
  end

  def fav_ranking
    travel_spots = TravelSpot.find(Favorite.group(:travel_spot_id).order("count(travel_spot_id) DESC").limit(10).pluck(:travel_spot_id))
    render json: travel_spots, include: %i[favorites], status: :ok
  end

  def review_ranking
    travel_spots = TravelSpot.find(Review.group(:travel_spot_id).order("count(travel_spot_id) DESC").pluck(:travel_spot_id))
    render json: travel_spots, include: %i[reviews], status: :ok
  end

  private

    def travel_spot_params
      params.require(:travel_spot).permit(
        :user_id,
        :genre_id,
        :name,
        :postcode,
        :prefecture_code,
        :address_city,
        :address_street,
        :address_building,
        :introduction,
        :access,
        :phone_number,
        :business_hour,
        :parking,
        :home_page,
        :latitude,
        :longitude,
        { images: [] }
      )
    end

    def set_travel_spot
      @travel_spot = TravelSpot.find(params[:id])
    end
end
