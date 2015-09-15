class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      puts "*************"
      puts @user.password
      puts "*************"
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      # notice: "Something went wrong. Try again or contact us."
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
