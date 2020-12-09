class HomeController < ApplicationController
  before_action :is_admin, only: [:restable]

  def home
    @movies = Movie.all
    
    @upcoming_movies = []
    @released_movies = []

    @movies.each do |movie|
      if movie.release_date <= Date.today
        @released_movies.append(movie)
      else
        @upcoming_movies.append(movie)

      end
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
