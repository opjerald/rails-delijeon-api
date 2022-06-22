class Product < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  belongs_to :category
  validates_presence_of :name, :price, :description, :category_id

end
