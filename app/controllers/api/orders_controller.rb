class Api::OrdersController < ApplicationController
  before_action :authorized
  before_action :set_order, only: %i[show create]

  def index
    @orders = Order.all.page(params[:page])

    render json: @orders, status: :ok
  end

  def show
    render json: @order, status: :ok
  end

  def create
    if Cart.where(id: params[:cart_id]).exists?
      @order = Order.new
      @order.params(params[:cart_id])

      if @order.save
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