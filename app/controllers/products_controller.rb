class ProductsController < ApplicationController
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
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :content, :category_id, :condition_id, :postage_type_id, :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end
end
