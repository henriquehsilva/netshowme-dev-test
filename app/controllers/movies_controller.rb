class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_movie, only: %i[edit show update destroy]

  def index
    @movies = user_signed_in? ? current_user.movies : Movie.all
  end

  def show; end

  def new; end

  def edit; end

  def create
    @movie = current_user.movies.new(movie_params)

    if @movie.save

      redirect_to movies_path
    else
      render :new
    end
  end

  def update
    if @movie.update(movie_params)
      redirect_to movies_path
    else
      render :edit
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :url, :poster).merge( user_id: params[:user_id])
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
