class Api::SearchesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    title = params[:title]
    title = title.parameterize(separator: '?')
    response = HTTP.get("http://www.omdbapi.com/?apikey=#{Rails.application.credentials.movie_api[:api_key]}&s=#{title}")
    
    searched_movie = response.parse
    @searches = searched_movie["Search"]

    render 'index.json.jb'
  end

  def show
    imdb_id = params[:id]
    
    response = HTTP.get("http://www.omdbapi.com/?apikey=#{Rails.application.credentials.movie_api[:api_key]}&i=#{imdb_id}")
    response.parse
    @search = response.parse
    saved_movie = Movie.find_by(imdb_id: imdb_id)
    p saved_movie
    if saved_movie
      @movie = saved_movie
    else
      added_movie = Movie.create(
        title: @search["Title"],
        director: @search["Director"],
        release_year: @search["Year"],
        runtime: @search["Runtime"],
        description: @search["Plot"],
        imdb_id: @search["imdbID"],
        img_url: @search["Poster"],
        rating: 0
      )
      p added_movie

    end




    render 'show.json.jb'
  end
end
