class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :product, only: [:edit, :update]

  
  def index
    @products = Product.order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.valid?
      @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    unless current_user.id == @product.user.id
      redirect_to root_path 
    end
  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  def destroy
    if product.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :content, :category_id, :condition_id, :postage_type_id, :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def product
    @product = Product.find(params[:id])
  end
end
