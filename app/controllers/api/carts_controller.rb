class Api::CartsController < ApplicationController
  before_action :set_cart, only: [:show, :destroy]

  def show
    render json: @cart, status: :ok
  end

  def create
    @cart = Cart.new()

    if @cart.save
      render json: @cart, status: :ok
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @cart.destroy
  end

  private

  def set_cart
    @cart = Cart.find_by(id: params[:id])
  end

  def cart_params
    params.require(:cart).permit(:id)
  end
end