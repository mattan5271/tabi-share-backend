class Api::RegistrationsController < ApplicationController
  def sign_up
    @user = User.new(registration_params)
    if @user.save
      login!
      render json: @user, status: :ok
    else
      render json: @user, status: :internal_server_error
    end
  end

  private

    def registration_params
      params.require(:registration).permit(:email, :password, :password_confirmation)
    end
end
