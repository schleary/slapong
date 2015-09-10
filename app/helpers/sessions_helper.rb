module SessionsHelper
    # returns the total revenue for a merchant's order items
  def revenue
    current_user.order_items.flatten.map { |item| item.subtotal }.reduce(:+)
  end

  def revenue_by_status
    # possible to call current_user.order?
    # if not, consider updating associations
    # OrderItem.last.order.current_state
    # User.find(25).order_items[0].order
    # difference between state and current state?
    # possible to iterate through order states?
  end

  def merchant_orders
    @orders = Order.all
    current_user.order_items.flatten.map { |item| item.order_id }.uniq
  end

  # returns the total number of orders associated with a merchant
  def orders_count
    current_user.order_items.flatten.map { |item| item.order_id }.uniq.count
  end

  # returns the total number of order items associated with a merchant
  def order_items_count
    current_user.order_items.flatten.count
  end

  # can order items within the same order have different states?
  def orders_by_status
  end
end
