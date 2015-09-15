class ShopController < ApplicationController
  def index
    @products = Product.all
    @products.to_a.reverse!
  end

  def new
    if session[:current_session_id]
      @product = Product.new
    else
      redirect_to root_path
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      # @product.user = current_user
      # @users = User.all
      # @users = @users.map {|user| user if user.confirmed? }
      # @users.each do |user|
      #   unless !user
      #     Resque.enqueue(EmailNewsJob, @product.id, user.id)
      #   end
      # end
      redirect_to products_path, notice: "Product has been created!"
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def show
    puts "BEFORE ****************"
    @product = Product.find(params[:id])
    puts '******'
    puts @product.inspect
    puts "*******"
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price_cents, :stock_quantity)
  end

  # *****************




# def show
#   find_product
#   @categories = @product.categories
#   @reviews = @product.reviews
#
#   # #added by Holly
#   @current_order = Order.where(:session_id => @current_session_id, :current_state => "pending")
#   if @current_order.size == 0
#     @order = Order.new(:session_id => @current_session_id, :current_state => "pending")
#     @order.save
#   else
#     #if current_order size == 1
#     @order = @current_order[0]
#   end
#
#   if OrderItem.find_by(:product_id => @product.id, :order_id => @order.id).present?
#     @order_item = OrderItem.find_by(:product_id => @product.id)
#   else
#     @order_item = OrderItem.new
#   end
# end

# def add_to_cart
#   find_product
#
#   # #added by Holly
#   @current_order = Order.where(:session_id => @current_session_id, :current_state => "pending")
#   if @current_order.size == 0
#     @order = Order.new(:session_id => @current_session_id, :current_state => "pending")
#     @order.save
#   else
#     #if current_order size == 1
#     @order = @current_order[0]
#   end
#
#   if OrderItem.find_by(:product_id => @product.id, :order_id => @order.id).present?
#     @order_item = OrderItem.find_by(:product_id => @product.id)
#   else
#     @order_item = OrderItem.new(:product_id => @product.id, :order_id => @order.id)
#
#   end
#   @order_item.save
# end





# def edit
#   find_product
#   if session[:user_id]
#     @categories = Category.all
#   else
#     redirect_to home_path
#   end
# end
#
# def update
#   @categories = Category.all
#   find_product
#   if @product.update(product_params) && session[:user_id]
#     #put this into myaccount dashboard once that's been created
#     redirect_to dashboard_path(current_user), notice: "Product has been updated!"
#   else
#     render "edit"
#   end
# end
#
# # products can now be 'retired' so can delete this
# def destroy
#   if find_product.destroy
#     redirect_to dashboard_path(current_user), notice: "Product has been deleted!"
#   else
#     render "delete", notice: "Try again."
#   end
# end

private


def find_product
  @product = Product.find(params[:id])
end

end
