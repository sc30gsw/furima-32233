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
  end
end
