class ProductsController < ApplicationController

  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
  end

  private
  
  def product_params
    params.require(:product).permit(:naem, :content, :price).merge(user_id: current_user.id)
  end
end
