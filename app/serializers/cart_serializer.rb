class CartSerializer < ActiveModel::Serializer
  attributes :id, :total_items, :total_price

  def total_items
    object.cart_items.count
  end

  def total_price
    total_sum = 0
    object.cart_items.each do |item|
      total_sum += (item.product.price * item.quantity)
    end

    total_sum.to_f
  end
end
