class OrdersController < ApplicationController
  def cart
      #perhaps put this stuff in a private method
      #can potentially later on substitute in her session id

      #creates a current order if one does not yet exist
      @current_order = Order.where(:session_id => @current_session_id, :current_state => "pending")
      if @current_order.size == 0
        @order = Order.new(:session_id => @current_session_id, :current_state => "pending")
        @order.save
      else
        #if current_order size == 1
        @order = @current_order[0]
      end

      #order_items are those that fall under the current order
      @order_items = OrderItem.where(:order_id => @order.id)


      # @current_order_item = OrderItem.where(:product_id => @product_id)
      # if @current_order_item == nil
      #   @order_item = OrderItem.new(:product_id => @product_id, :quantity => 1)
      #   @order_item.save
      #
      # else
      #   @order_item = @current_order_item[0]
      # end


      #can do an elsif here with if order size is greater than 1, then raise an excepetion
    end

    def new
      @order = Order.new
    end

    def save
      @order = Order.save
    end

    def edit
      #otherwise, raise exception
      @current_order = Order.where(:session_id => @current_session_id, :current_state => "pending")
      @order = @current_order[0]
    end

    def update
      @order = Order.find(params[:id])
      @order.update(params.require(:order).permit(:email, :address, :state, :city, :zip, :cc_name, :cc_number, :cc_expiration, :cc_cvv, :billing_zip))
      @order.current_state = "paid"
      @order.checkout_time = DateTime.now
      @order.save

      if @order.save
        @order_items = @order.order_items
        @order_items.each do |item|
          @product = Product.find(item.product_id)
          @product.stock -= item.quantity
          @product.save
        end
        redirect_to orders_show_path
      else
        flash.now[:error] = "Could not save order item!"
        render 'edit'
      end
    end

    def index
      @orders = Order.all
    end

    def show
      # If merchant viewing order fulfillment details
      if signed_in && @current_session_id != Order.find(params[:id]).session_id
        @order_fullfillment = true
        @order = current_user.orders.find(params[:id])
        @order_items = @order.orderitems do |item|
          item.product.user_id == current_user.id
        end
      # If guest, or merchant placing own order
      else
        @order = Order.find(params[:id])
        @order_items = OrderItem.where(:order_id => @order.id)
      end
    end

    def create
      @order = Order.create(params.require(:order).permit(:email, :address, :state, :city, :zip, :cc_name, :cc_number, :cc_expiration, :cc_cvv, :billing_zip))
      redirect_to new_order_path(@order)
      if @order = Order.find_by_id(params[:id])
        render 'show'
      else
        render 'show'
      end
    end

    def destroy
    #   @order = Order.find_by_id(session["user_id"])
    #   @order.destroy
    #   session["user_id"] = nil
    #   redirect_to "/"
    end
    
end
