class PurchaseInfosController < ApplicationController

  def index
  end

  def new
    @purchase_user = PurchaseUser.new
  end

  def create
    @purchase_user = PurchaseUser.new
    if @purchase_user.valid?
      @purchase_user.save
      redirect_to root_path
    else
      render action: :new
    end
  end
end
