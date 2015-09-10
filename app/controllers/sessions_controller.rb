class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    session[:user_id] = @user.id
    # Refactor using a private method called user_params
    # @user = User.find_by_email(params[:session][:email])
    # if @user && @user.authenticate(params[:session][:password])
    #   session[:user_id] = @user.id
    #   redirect_to dashboard_path(@user)
    # else
    #   flash.now[:error] = "Try again!"
    #   render 'new'
    # end
  end

  def destroy
    session[:user_id] = nil
    redirect_to home_path
  end

  def show
    if signed_in
      @products = current_user.products
      revenue # .nil? ? revenue == 0 : revenue
      orders_count
      order_items_count
    else
      redirect_to home_path
    end
  end
end
