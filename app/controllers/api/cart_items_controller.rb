class Api::CartItemsController < ApplicationController
  before_action :set_cart_item, only: %i[show update destroy]
  before_action :set_cart

  def index
    @cart_items = @cart.cart_items.page(params[:page])

    render json: @cart_items, status: :ok
  end

  def show
    render json: @cart_item, status: :ok
  end

  def create
    if @cart.cart_items.where(product_id: params[:product_id]).exists?
      @item_exist = @cart.cart_items.find_by(product_id: params[:product_id])
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

  def set_cart
    @cart = Cart.find_by(id: params[:cart_id])
  end

  def set_cart_item
    @cart_item = Cart.find_by(id: params[:cart_id]).cart_items.find_by(id: params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :product_id, :cart_id)
  end

  def page_params
    params.require(:cart_item).permit(:page)
  end
end