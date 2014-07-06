class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout false
  
  def index
    @static = Static.where(id: 1).first
  end
  
  def reset_database
    load "#{Rails.root}/db/seeds.rb" 
    redirect_to params[:return_to] || bhf.root_url
  end
  
  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return unless session[:is_admin]
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end

    def require_user
      unless current_user
        flash[:notice] = 'You must be logged in to access this page'
        redirect_to new_user_session_url
        return false
      end
    end

    def require_no_user
      if current_user
        # flash[:notice] = 'You must be logged out to access this page'
        redirect_to bhf.root_url
        return false
      end
    end
    
    
end
