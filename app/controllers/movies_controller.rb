class MoviesController < ApplicationController
  def create
    #params looks like
    #  Parameters: {"the_title"=>"1", "the_year"=>"2", "the_duration"=>"3", "the_description"=>"3", "the_iamge"=>"4", "the_director"=>"2"} 

    m = Movie.new 
    m.title = params.fetch("the_title")
    m.year = params.fetch("the_year")
    m.duration = params.fetch("the_duration")
    m.description = params.fetch("the_description")
    m.image = params.fetch("the_image")
    m.director_id = params.fetch("the_director_id")

    m.save

    redirect_to("/movies")
    
    #Retrieve the user's inputs from params
    #create a record in movie table
    #Populate each column with the user input 
    #save
    #redirect user back to /movies URL 
  end 
  
  
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end
end
