class HomeController < ApplicationController

  def home

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
      # Send an Email
      flash[:notice] = I18n.t('home.request_contact.email_sent')
    end

    redirect_to root_path  

  end



  def webform
    @movie = Movie.new
  end

  def restable

  end
end
