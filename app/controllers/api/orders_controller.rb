class Api::OrdersController < ApplicationController
  before_action :set_order, only: [:show, :create]

  def show
    render json: @order, status: :ok
  end

  def create
    if Cart.where(id: params[:cart_id]).exists?
      @order = Order.new()

      if @order.save
        cart_items = []
        @items = CartItem.includes(:product).where(cart_id: params[:cart_id])
        @items.each do |item|
          cart_items.push({
                            order_id: @order.id,
                            product_id: item.product_id,
                            price: item.product.price,
                            quantity: item.quantity
                          })
        end
        OrderItem.insert_all!(cart_items)
        Cart.find_by(id: params[:cart_id]).destroy

        render json: @order, status: :created
      else
        render json: { message: 'Something went wrong when setting up an order' }, status: :unprocessable_entity
      end
    else
      render json: { message: 'There are no such cart' }, status: :bad_request
    end
  end

  private

  def set_order
    @order = Order.find_by(id: params[:id])
  end

  def order_params
    params.require(:order).permit(:cart_id)
  end
end