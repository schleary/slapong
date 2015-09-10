class ShopController < ApplicationController
  def index
    @products = Product.all
    @products.to_a.reverse!
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      # @users = User.all
      # @users = @users.map {|user| user if user.confirmed? }
      # @users.each do |user|
      #   unless !user
      #     Resque.enqueue(EmailNewsJob, @product.id, user.id)
      #   end
      # end
      redirect_to products_path
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
    @product = Product.find(params[:id])
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

end
