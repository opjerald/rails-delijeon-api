class Product < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  belongs_to :category
  validates_presence_of :name
  validates_presence_of :price
  validates_presence_of :description
  validates_presence_of :category_id

  scope :recent, -> { order(created_at: :desc) }
end
