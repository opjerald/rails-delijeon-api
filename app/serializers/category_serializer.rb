class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :product_count

  def product_count
    object.products.count
  end
end
