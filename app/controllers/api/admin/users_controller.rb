class Api::Admin::UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy travel_spots reviews]

  def index
    render json: User.all, include: %i[travel_spots favorites], status: :ok
  end

  def show
    render json: @user, include: [{ reviews: %i[user travel_spot] }, { travel_spots: %i[user genre] }], status: :ok
  end

  def create
    user = User.new(user_params)
    staus = user.save ? :ok : :internal_server_error
    render json: user, status: staus
  end

  def update
    staus = @user.update(user_params) ? :ok : :internal_server_error
    render json: @user, status: staus
  end

  def destroy
    reset_session if @user.id == current_user.id
    staus = @user.destroy ? :ok : :internal_server_error
    render json: @user, status: staus
  end

  def travel_spots
    render json: TravelSpot.where(user_id: @user.id), include: %i[user genre favorites], status: :ok
  end

  def reviews
    render json: Review.where(user_id: @user.id), include: %i[user travel_spot], status: :ok
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :name, :sex, :age, :introduction, :profile_image, :is_admin)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
