class MoviesController < ApplicationController
  before_action :authenticate_user!, only: %i(new create edit update)
  before_action :get_movies, only: %i(index destroy)
  before_action :set_movie_by_user, only: %i(edit update destroy)
  before_action :set_movie, only: :show

  def index; end

  def show; end

  def new; end

  def edit; end

  def create
    @movie = current_user.movies.new(movie_params)
    if @movie.save
      flash[:success] = "Vídeo criado com sucesso!"
      redirect_to movies_path
    else
      render :new
    end
  end

  def update
    if @movie.update(movie_params)
      flash[:success] = "Vídeo editado com sucesso!"
      redirect_to movies_path
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    flash[:success] = "Vídeo removido com sucesso!"
    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :url, :poster).merge( user_id: params[:user_id])
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def set_movie_by_user
    @movie = current_user.movies.find(params[:id])
  end

  def get_movies
    @movies = user_signed_in? ? current_user.movies : Movie.all
  end
end
