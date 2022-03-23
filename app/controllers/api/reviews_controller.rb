class Api::ReviewsController < ApplicationController
  before_action :set_review, only: %i[show update destroy]

  def show
    render json: @review, status: :ok
  end

  def create
    review = current_user.reviews.new(review_params)
    staus = review.save ? :ok : :internal_server_error
    render json: review, status: staus
  end

  def update
    staus = @review.update(review_params) ? :ok : :internal_server_error
    render json: @review, status: staus
  end

  def destroy
    staus = @review.destroy ? :ok : :internal_server_error
    render json: @review, status: staus
  end

  private

    def review_params
      params.require(:review).permit(:user_id, :travel_spot_id, :title, :body, :rating, { images: [] })
    end

    def set_review
      @review = Review.find(params[:id])
    end
end
