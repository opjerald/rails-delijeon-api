class Api::OrderItemsController < ApplicationController
  before_action :authorized
  before_action :set_order_item, only: [:show]

  def index
    @order_items = OrderItem.includes(:product).where(order_id: params[:order_id])

    render json: @order_items, status: :ok
  end

  def show
    render json: @order_item, status: :ok
  end

  private

  def set_order_item
    @order_item = OrderItem.includes(:product).find_by(id: params[:id], order_id: params[:order_id])
  end

  def order_item_params
    params.require(:order_item).permit(:order_id, :product_id, :price, :quantity)
  end
end