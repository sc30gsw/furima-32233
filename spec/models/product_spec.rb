require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品' do
    context '商品の出品がうまくいくとき' do
      it 'すべての項目が存在すれば出品できる' do
        expect(@product).to be_valid
      end
    end

    context '商品の出品がうまくいかないとき' do
      it '画像が空だと出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと出品できない' do
        @product.name = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空だと出品できない' do
        @product.content = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Content can't be blank")
      end
      it '商品のカテゴリーが空だと出品できない' do
        @product.category_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it '商品のカテゴリーの値が1のとき出品できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品状態が空だと出品できない' do
        @product.condition_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank")
      end
      it '商品状態の値が1だと出品できない' do
        @product.condition_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Condition must be other than 1')
      end
      it '配送料の負担が空だと出品できない' do
        @product.postage_type_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Postage type can't be blank")
      end
      it '配送料の負担の値が1だと出品できない' do
        @product.postage_type_id = 1
        @product.valid?
        expect(@produc)
      end
      it '発送元の地域が空だと出品できない' do
        @product.prefecture_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送元の地域の値が1以外だと出品できない' do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '発送までの日数が空だと出品できない' do
        @product.delivery_day_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery day can't be blank")
      end
      it '発送までの日数の値が1以外だと出品できない' do
        @product.delivery_day_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Delivery day must be other than 1')
      end
      it '販売価格が空だと出品できない' do
        @product.price = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が全角文字列だと出品できない' do
        @product.price = 'テスト'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not included in the list')
      end
      it '販売価格が300以下では出品できない' do
        @product.price = 200
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not included in the list')
      end
      it '販売価格が9,999,999以上だと出品できない' do
        @product.price = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not included in the list')
      end
    end
  end
end
