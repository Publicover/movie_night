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

    # url_name = @movie.name.gsub(' ', '+')

    # json = HTTParty.get("http://www.omdbapi.com/?apikey=&t=gummo")
    # json = HTTParty.get("http://www.omdbapi.com/?apikey=#{ENV['OMDB_KEY']}&t=#{url_name}")
    json = Movie.call_movie(@movie.name)

    if json["Response"] == "False"
      flash[:alert] = "We can't find that. Check your spelling, maybe?"
      render 'new'
    else
      @movie.name = json["Title"]
      @movie.rated = json["Rated"]
      @movie.released = json["Released"]
      @movie.runtime = json["Runtime"]
      @movie.genre = json["Genre"]
      @movie.director = json["Director"]
      @movie.writer = json["Writer"]
      @movie.actors = json["Actors"]
      @movie.plot = json["Plot"]
      # @movie.language = json["Language"]
      @movie.country = json["Country"]
      @movie.awards = json["Awards"]
      @movie.poster = json["Poster"]
      @movie.imdb = json["Ratings"][0]["Value"]
      # @movie.rotten_tomatoes = json["Ratings"][1]["Value"]
      @movie.metacritic = json["Ratings"][2]["Value"]
      # @movie. = json["Ratings"]
      if json["Website"] == "N/A"
        @movie.website = 'No webiste'
      else
        @movie.website = json["Website"]
      end

      if @movie.save
        redirect_to movie_path(@movie)
      else
        render 'new'
      end
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
