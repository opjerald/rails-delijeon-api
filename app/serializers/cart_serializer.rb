class CartSerializer < ActiveModel::Serializer
  attributes :id, :total_items, :total_price

  def total_items
    CartItem.includes(:product).where(cart_id: object.id).count
  end

  def total_price
    total_sum = 0
    @items = CartItem.includes(:product).where(cart_id: object.id)
    @items.each do |item|
      total_sum += (item.product.price * item.quantity)
    end

    total_sum.to_f
  end
end
