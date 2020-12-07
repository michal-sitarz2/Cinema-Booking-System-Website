class ApplicationController < ActionController::Base

  protected
    def is_admin
      if user_signed_in?
        if not current_user.admin?
          flash[:alert] = "Unauthorized access"
          redirect_to root_url
        end
      else
        redirect_to new_user_session_path
      end
    end
    
end
