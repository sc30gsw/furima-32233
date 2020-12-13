class PurchaseInfosController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :product, only: [:index, :create]

  
  def index
    @purchase_address = PurchaseAddress.new
    if @product.product_user.present?
      redirect_to root_path 
    end
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :token).merge(user_id: current_user.id, product_id: params[:product_id])
  end

  def product
    @product = Product.find(params[:product_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @product.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
  end
end
