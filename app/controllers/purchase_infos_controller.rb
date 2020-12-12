class PurchaseInfosController < ApplicationController
  def index
  end

  def new
    @purcahse_info = PurchaseInfo.new
  end

  def create
    @purchase_info = PurchaseInfo.new(purchase_params)
    if @purcahse_info.valid?
      @purcahse_info.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  private

  def purchase_params
    params.require(:purchase_adress).permit(:postal_code, :prefecture_id, :city, :adress, :building_name, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end
