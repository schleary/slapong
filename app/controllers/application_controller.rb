class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include ApplicationHelper

  protect_from_forgery with: :exception

  before_filter :authorize, only: [:edit, :update]

  # # Any more helpers? Add signed_in helper?
  helper_method :current_user

  helper_method :admin?
  #
  # protected
  #
  # def admin?
  #   session[:email] == 'schleary@gmail.com'
  # end
  #
  # def authorize
  #   unless admin?
  #     flash[:error] = "unauthorized access"
  #     redirect_to home_path
  #     false
  #   end
  # end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  

  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end

end
