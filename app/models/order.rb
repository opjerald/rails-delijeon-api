class Order < ApplicationRecord
  attr_accessor :cart_id

  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items
  after_save :transfer_items

  def params(cart_id)
    @cart_id = cart_id
  end

  def initialize(attributes = nil)
    super
  end

  def transfer_items
    cart_items = []
    @items = CartItem.includes(:product).where(cart_id: self.cart_id)
    @items.each do |item|
      cart_items.push({
                        order_id: self.id,
                        product_id: item.product_id,
                        price: item.product.price,
                        quantity: item.quantity
                      })
    end
    OrderItem.insert_all!(cart_items)
    Cart.find_by(id: self.cart_id).destroy
  end
end
