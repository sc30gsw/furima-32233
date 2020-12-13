class PurchaseInfosController < ApplicationController
  def index
    @purchase_address = PurchaseAddress.new
    @product = Product.find(params[:product_id])
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
    params.permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: purchase_params(product_id: params[:price]),
        card: purchase_params[:token],
        currency: 'jpy'
      )
    end
end
