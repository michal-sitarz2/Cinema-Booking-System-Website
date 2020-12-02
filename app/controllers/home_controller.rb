class HomeController < ApplicationController

  def home
    @movies = Movie.all

    movies = {}
    @upcoming_movies = []
    upcoming_counter = 0

    @movies.each do |movie|
      if movie.release_date <= Date.today
        movies[movie] = movie['release_date']
      else
        if upcoming_counter <= 6
          @upcoming_movies.append(movie)
          upcoming_counter+=1
        end
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

  def book_tickets
    @movies = Movie.all
    @screenings = Screening.all
    @cinemas = Cinema.all

    @dates_week = []
    today = Date.today

    i = 0
    loop do
      if i == 7
        break
      end
      @dates_week.append(today+i)
      i+=1
    end
  end

end
