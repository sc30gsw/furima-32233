require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '商品購入' do
    context '商品が購入できるとき' do
      it 'すべての項目が存在すれば購入できる' do
        expect(@purchase_address).to be_valid
      end
    end

    context '商品が購入できないとき' do
      it 'トークンが空だと購入できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空だと購入できない' do
        @purchase_address.postal_code = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号にハイフンがないと購入できない' do
        @purchase_address.postal_code = "12345678"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code Is invalid. Input half-width characters")
      end

      it '郵便番号が前半３つの数字、後半４つの数字でないと購入できない' do
        @purchase_address.postal_code = "1234-567"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code Is invalid. Input half-width characters")
      end

      it '都道府県が空だと登録できない' do
        @purchase_address.prefecture_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '都道府県の値が1だと購入できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '市区町村が空だと購入できない' do
        @purchase_address.city = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end

      it '市区町村が半角英数字だと購入できない' do
        @purchase_address.city = 111
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City Is invalid. Input full-width characters")
      end

      it '番地が空だと登録できない' do
        @purchase_address.address = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'user_idの値が空だと購入できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end

      it 'product_idの値が空だと購入できない' do
        @purchase_address.product_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end
