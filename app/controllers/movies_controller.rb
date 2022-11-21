class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show]

  def index
    @movies = Movie.all
  end

  def new
    @movies = Movie.new
  end

  def create
    @movies = Movie.create(movie_params)
    if @movies.save
      redirect_to movie_path(@movie)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating)
  end

end
