module ShopHelper
  def out_of_stock?(stock)
    if stock == 0
      "Out of Stock"
    end
  end
end
