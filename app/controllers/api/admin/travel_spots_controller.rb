class Api::Admin::TravelSpotsController < ApplicationController
  before_action :set_travel_spot, only: %i[show update destroy reviews]

  def index
    render json: TravelSpot.all, include: %i[user genre favorites], status: :ok
  end

  def show
    render json: @travel_spot, include: [{ reviews: %i[user travel_spot] }], status: :ok
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

  def reviews
    render json: Review.where(travel_spot_id: @travel_spot.id), include: %i[user travel_spot], status: :ok
  end

  def prefectures
    render json: JpPrefecture::Prefecture.all, status: :ok
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
