class CartsController < ApplicationController
  def new
    @cart = Cart.new
  end

  def index
    @carts = Cart.all
  end

  def create
    @cart = Cart.new
    if @cart.save
      # session["user_id"] = @user.id
      redirect_to "/"
    else
      # redirect_to "/", :error => "There was an error creating your cart."
      redirect_to "/"
    end
  end
end
