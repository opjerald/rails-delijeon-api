class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :active, :category

  def category
    object.category.name
  end
end
