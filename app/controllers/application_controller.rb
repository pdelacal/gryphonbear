class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def current_user
    @current_user = User.find(session[:id]) if session[:id]
  end
  helper_method :current_user

  def is_logged_in?
    not current_user.nil?
  end
  helper_method :is_logged_in?
end
