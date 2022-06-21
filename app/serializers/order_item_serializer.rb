class OrderItemSerializer < ActiveModel::Serializer
  attributes :id, :product, :price, :quantity

  def product
    object.product.name
  end
end
