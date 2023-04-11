class Api::MoviesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    # raw_movies = Movie.where("!rating.to_s.empty?")
    raw_movies = Movie.all
    p raw_movies

    @movies =  raw_movies 
    #order('rating DESC') - TODO: order alphabetically by title

    render 'index.json.jb'
  end


  def create
    if !Movie.find_by(id: params[:id])
      response = HTTP.get("http://www.omdbapi.com/?apikey=#{Rails.application.credentials.movie_api[:api_key]}&i=#{params[:imbd_id]}")
      p response
      new_movie = response.parse

      @movie = Movie.create(
        title: new_movie["Title"],
        director: new_movie["Director"],
        release_year: new_movie["Year"],
        runtime: new_movie["Runtime"],
        description: new_movie["Plot"],
        img_url: new_movie["Poster"],
        imdb_id: new_movie["imdbID"],
        rating: new_movie["rating"]
      )
      if @movie.save!
        render "show.json.jb"
      else
        render json: { error: @movie.errors }
      end
    end

  end

  def update
    p "UPDATE METHOD"
p params
    @movie = Movie.find_by(imdb_id: params[:imdb_id])
    @movie = Movie.find_by(imdb_id: params[:id])
    p "UPDATE METHOD"
    p @movie
    @movie.update_attributes(rating: params[:rating])

  

    render 'show.json.jb'

  end

  def destroy
    @movie = Movie.find_by(id: params[:id])
    @movie.destroy

    render json: {message: "Your movie has been successfully destroyed!"}
  end
end
