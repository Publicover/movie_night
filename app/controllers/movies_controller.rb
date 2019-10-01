class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def edit
  end

  def create
    # @movie = Movie.where(name: movie_params[:name]).first_or_create do |movie|
    #   movie.call_movie(movie.name)
    # end

    @movie = Movie.new(movie_params)

    url_name = @movie.name.gsub(' ', '+')

    # json = HTTParty.get("http://www.omdbapi.com/?apikey=&t=gummo")
    json = HTTParty.get("http://www.omdbapi.com/?apikey=#{ENV['OMDB_KEY']}&t=#{url_name}")

    @movie.name = json["Title"]

    if @movie.save
      redirect_to movies_path
    else
      render 'new'
    end
  end

  def update
    if @movie.update
      redirect_to movies_path
    else
      render 'edit'
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:name)
  end
end
