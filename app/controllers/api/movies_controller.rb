class Api::MoviesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    raw_movies = Movie.where("(thumbs_up) > 0").or(Movie.where("(thumbs_down) > 0"))

    @movies =  raw_movies.order('thumbs_up DESC')

    render 'index.json.jb'
  end


  def create
    if !Movie.find_by(id: params[:id])
      response = HTTP.get("http://www.omdbapi.com/?apikey=#{Rails.application.credentials.movie_api[:api_key]}&i=#{params[:imbd_id]}")
      new_movie = response.parse

      @movie = Movie.create(
        title: new_movie["Title"],
        director: new_movie["Director"],
        release_year: new_movie["Year"],
        runtime: new_movie["Runtime"],
        description: new_movie["Plot"],
        img_url: new_movie["Poster"],
        imdb_id: new_movie["imdbID"],
        thumbs_up: 0,
        thumbs_down: 0
      )
      if @movie.save!
        render "show.json.jb"
      else
        render json: { error: @movie.errors }
      end
    end

  end

  def update
    @movie = Movie.find_by(imdb_id: params[:imdb_id])

    if params[:thumb] == "up"
      @movie = Movie.find_by(imdb_id: params[:id])
      p @movie
      @movie.update_attributes(thumbs_up: @movie.thumbs_up + 1)
    elsif params[:thumb] == "down"
      @movie = Movie.find_by(imdb_id: params[:id])
      @movie.update_attributes(thumbs_down: @movie.thumbs_down + 1)
    end
  

    render 'show.json.jb'

  end

  def destroy
    @movie = Movie.find_by(id: params[:id])
    @movie.destroy

    render json: {message: "Your movie has been successfully destroyed!"}
  end
end
