class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :current_user, :signed_in?

  def login(user)
    session[:user_id] = user.id
  end

  def log_out
    session[:user_id] = nil
  end

  def current_user
    if session[:user_id].present? 
      @current_user ||= User.find(session[:user_id])
    end
  end

  def signed_in?
    !!current_user
  end

  def authenticate_user!
    if !signed_in?
      redirect_to sign_in_path
    end
  end

end


