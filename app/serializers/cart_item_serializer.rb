class CartItemSerializer < ActiveModel::Serializer
  attributes :id, :product, :quantity

  def quantity
    object.quantity.to_i
  end

  def product
    object.product.name
  end
end
