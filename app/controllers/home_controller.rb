class HomeController < ApplicationController
  before_action :is_admin, only: [:restable]

  def home
    # Filters the movies into two arrays with the use of scopes
    # Firstly, the upcoming movies, i.e. all the movies that are released after today
    @upcoming_movies = Movie.release_after(Date.today)
    # Then, the released movies, i.e. all the movies that have been released before today
    @released_movies = Movie.release_before(Date.today)
  end

  def restable
    # Sorts all the movies by the date so that the table it easier to follow
    movies = Movie.all
    @movies = movies.sort_by {|movie| movie.release_date}

    @cinemas = Cinema.all

    # Filters all the screenings that have not happened yet
    screenings = Screening.screening_upcoming
    # Sorts the screenings based on screening date
    @screenings = screenings.sort_by{|screening| screening.screening_date}

    # Destroying screenings that have passed
    screenings_passed = Screening.screening_passed
    screenings_passed.destroy_all

    # Bookings filtered to show upcoming ones, not the history
    @bookings = Booking.booking_upcoming
  end


  def contact
  end


  def request_contact
    name = params[:name]
    email = params[:email]
    telephone = params[:telephone]
    message = params[:message]

    # If there is no email, an error message will be displayed
    if email.blank?
      flash[:alert] = I18n.t('messages.request_contact.no_email')
      redirect_to contact_url
    # Or if there is no message supplied
    elsif message.blank?
      flash[:alert] = I18n.t('messages.request_contact.no_message')
      redirect_to contact_url
    # Otherwise the email will be sent
    else
      ContactMailer.contact_email(email, name, telephone, message).deliver_now
      flash[:notice] = I18n.t('messages.request_contact.email_sent')
      redirect_to root_path
    end
  end


  def book_tickets
    @movies = Movie.all
    @screenings = Screening.all
    @cinemas = Cinema.all

    # Displays screenings for today and the upcoming week
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
