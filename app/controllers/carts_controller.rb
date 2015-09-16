class CartsController < ApplicationController
  def new
    @product = Product.find(params[:id])
    @order_item = OrderItem.new

  end

  def index
    @order_items = OrderItem.all
  end

  def create
    @order_item = OrderItem.new
    if @order_item.save
      # session["user_id"] = @user.id
      redirect_to "/"
    else
      # redirect_to "/", :error => "There was an error creating your cart."
      redirect_to "/"
    end
  end
end
