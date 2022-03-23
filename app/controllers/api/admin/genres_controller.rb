class Api::Admin::GenresController < ApplicationController
  before_action :set_genre, only: %i[show update destroy]

  def index
    render json: Genre.all, status: :ok
  end

  def show
    render json: @genre, status: :ok
  end

  def create
    genre = Genre.new(genre_params)
    staus = genre.save ? :ok : :internal_server_error
    render json: genre, status: staus
  end

  def update
    staus = @genre.update(genre_params) ? :ok : :internal_server_error
    render json: @genre, status: staus
  end

  def destroy
    staus = @genre.destroy ? :ok : :internal_server_error
    render json: @genre, status: staus
  end

  private

    def genre_params
      params.require(:genre).permit(:name, :image)
    end

    def set_genre
      @genre = Genre.find(params[:id])
    end
end
