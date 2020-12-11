class ApplicationController < ActionController::Base
  # Uses a module (models/concerns/current_cart.rb)
  include CurrentCart
  # It is used to create a current cart if one does not already exist
  before_action :set_cart

  protected
    # A function which checks if the current user is an admin
    def is_admin
      # Firstly checks if the user is signed in at all
      if user_signed_in?
        # And then verifies if the user is not an admin
        # The function is used to grant access to specific views
        if not current_user.admin?
          # If the user is not an admin they will be redirected back to home page
          # with an error message
          flash[:alert] = I18n.t('messages.unauthorized')
          redirect_to root_url
        end
      else
        redirect_to new_user_session_path
      end
    end

end
