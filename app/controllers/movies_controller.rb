class MoviesController < ApplicationController
  def index
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      render :index, status: :created
    else
      render :new
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :url).merge( user_id: params[:user_id])
  end
end
