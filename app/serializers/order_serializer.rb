class OrderSerializer < ActiveModel::Serializer
  attributes :id, :total_items, :total_price, :placed_at

  def total_items
    OrderItem.includes(:product).where(order_id: object.id).count
  end

  def total_price
    total_sum = 0
    @items = OrderItem.where(order_id: object.id)
    @items.each do |item|
      total_sum += (item.quantity * item.price)
    end

    total_sum
  end

  def placed_at
    object.created_at
  end
end
