class Api::SessionsController < ApplicationController
  def sign_in
    @user = User.find_by(email: session_params[:email])
    if @user && @user&.authenticate(session_params[:password])
      login!
      render json: @user, status: :ok
    else
      render json: @User, status: :internal_server_error
    end
  end

  def sign_out
    reset_session
  end

  private

    def session_params
      params.require(:session).permit(:email, :password)
    end
end
