class Api::UsersController < ApplicationController
  before_action :set_user, only: %i[show destroy]

  def show
    render json: @user, status: :ok, include: [
      { travel_spots: %i[user favorites reviews] },
      { favorited_travel_spots: %i[user reviews favorites] },
      { reviews: %i[user travel_spot] },
      { followings: %i[followings followers] },
      { followers: %i[followings followers] },
      :favorites
    ]
  end

  def destroy
    reset_session if @user.id == current_user.id
    staus = @user.destroy ? :ok : :internal_server_error
    render json: @user, status: staus
  end

  def follow
    current_user.follow(params[:id])
  end

  def unfollow
    current_user.unfollow(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :name, :sex, :age, :introduction, :profile_image, :is_admin)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
