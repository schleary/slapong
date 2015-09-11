class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include ApplicationHelper
  protect_from_forgery with: :exception
  before_filter :authorize, only: [:edit, :update]
  # # Any more helpers? Add signed_in helper?
  # helper_method :current_user
  #
  # # Since all controllers inherit from this one, this action will be performed before each page loads
  # before_filter :request_init
  #
  # # This action determines whether this session has been created, and, if not, generates one.
  # # This session will be the same for every page.
  # def request_init
  #   if session["current_session_id"] == nil
  #     session["current_session_id"] = SecureRandom.uuid
  #   end
  #   @current_session_id = session["current_session_id"]
  # end
  #
  # def current_user
  #   @current_user ||= User.find(session[:current_user_id]) if session[:current_user_id]
  # end
  #
  # def signed_in
  #   !current_user.nil?
  # end
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end

end
