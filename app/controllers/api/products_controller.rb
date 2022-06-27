class Api::ProductsController < ApplicationController
  include Pagy::Backend
  before_action :set_product, only: %i[show update destroy]

  # GET /products
  def index
    # @products = Product.all.includes(:category)
    # @products = Product.includes(:category).price_range(params[:price_gt], params[:price_lt])
    # @products = Product.includes(:category).search(params[:q])
    @q = Product.includes(:category).ransack(params[:q])
    @q.sorts = 'price asc' if @q.sorts.empty? && params[:sort] == 'price_asc'
    @q.sorts = 'price desc' if @q.sorts.empty? && params[:sort] == 'price_desc'
    @pagy, @records = pagy(@q.result)

    meta = pagy_metadata(@pagy, absolute: true)
    render json: @records, meta: meta, status: :ok
  end

  # GET /products/1
  def show
    render json: @product
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
  end

  private

  def metadata

  end

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:name, :description, :price, :active, :category_id)
  end

end
