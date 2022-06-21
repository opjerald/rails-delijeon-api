class Api::CartItemsController < ApplicationController
  before_action :set_cart_item, only: %i[show update destroy]

  def index
    @cart_items = CartItem.includes(:product).where(cart_id: params[:cart_id])

    render json: @cart_items, status: :ok
  end

  def show
    render json: @cart_item, status: :ok
  end

  def create
    if CartItem.includes(:product).where(product_id: params[:product_id], cart_id: params[:cart_id]).exists?
      @item_exist = CartItem.includes(:product).find_by(product_id: params[:product_id], cart_id: params[:cart_id])
      @item_exist.quantity += params[:quantity]
      @item_exist.save

      render json: @item_exist, status: :ok
    else
      @cart_item = CartItem.new(cart_item_params)

      if @cart_item.save
        render json: @cart_item, status: :ok
      else
        render json: @cart_item.errors, status: :unprocessable_entity
      end
    end
  end

  def update
    if @cart_item.update(quantity: params[:quantity])
      render json: @cart_item, status: :ok
    else
      render json: @cart_item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @cart_item.destroy
  end

  private

  def set_cart_item
    @cart_item = CartItem.includes(:product).where(id: params[:id], cart_id: params[:cart_id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :product_id, :cart_id)
  end

  def other_params
    params.require(:cart_item).permit(:page)
  end
end