class HomeController < ApplicationController

  def home
    @movies = Movie.all

    movies = {}
    @upcoming_movies = []

    @movies.each do |movie|
      if movie.release_date <= Date.today
        movies[movie] = movie['release_date']
      else
        @upcoming_movies.append(movie)
      end
    end

    movies.sort_by {|k,v| v}.reverse
    counter = 0
    movies.each do |movie,date|
      if counter == 0
         @movie1 = movie
       elsif counter == 1
         @movie2 = movie
       elsif counter == 2
         @movie3 = movie
       end
       counter = counter + 1
    end

  end

  def restable
    @movies = Movie.all
    @cinemas = Cinema.all
    @actors_m = Actor.all

    @actors = []
    @movies.each do |movie|
      movie_actors = ""
      movie.actors.each do |actor|
        movie_actors = movie_actors + actor.name + " " + actor.surname + " | "
      end
      @actors.append(movie_actors)
    end


    @screenings = Screening.all
  end


  def contact

  end


  def request_contact
    name = params[:name]
    email = params[:email]
    telephone = params[:telephone]
    message = params[:message]

    if email.blank?
      flash[:alert] = I18n.t('home.request_contact.no_email')
    else
      ContactMailer.contact_email(email, name, telephone, message).deliver_now
      flash[:notice] = I18n.t('home.request_contact.email_sent')
    end

    redirect_to root_path

  end


  def webform
    @movie = Movie.new
  end

end
