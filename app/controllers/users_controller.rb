class UsersController < ApplicationController
  # def index
  #   @users = User.all
  #   current_user = User.find_by_id(session[:current_session_id])
  # end
  #
  # def new
  #   @user = User.new
  # end
  #
  # def create
  #   @user = User.new(params.require(:user).permit(
  #     :username,
  #     :email,
  #     :password,
  #     :password_confirmation
  #     ))
  #   if @user.save
  #     session[:user_id] = @user.id
  #     redirect_to dashboard_path(@user)
  #   else
  #     flash.now[:error] = "Try again!"
  #     render 'new'
  #   end
  # end
  #
  # def show
  #   @user = User.find(params[:id])
  #   @products = @user.products
  # end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
