class UsersController < ApplicationController
  def index
    @users = User.all
    current_user = User.find_by_id(session[:current_session_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(
      :username,
      :email,
      :password,
      :password_confirmation
      ))
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path(@user)
    else
      flash.now[:error] = "Try again!"
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @products = @user.products
  end

end
