class CartItemSerializer < ActiveModel::Serializer
  attributes :id, :product, :price, :quantity

  def quantity
    object.quantity.to_i
  end

  def price
    object.product.price.to_f
  end

  def product
    object.product.name
  end
end
