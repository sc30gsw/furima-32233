class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :product_user_id, :product_id, :user_id
  
  # バリデーションの処理
  with_options presence: true do
    # 住所情報
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: 'Is invalid. Input half-width characters'}
    validates :prefecture_id
    validates :city, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: 'Is invalid. Input full-width characters'}
    validates :address # 番地については可能性が多いため正規表現を用いていない
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: 'Is invalid, Do not need a hyphen'}
    validates :product_user_id
    validates :product_id
    validates :user_id
  end
  

  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    # product_usersテーブルの情報
    product_user = ProductUser.create(product_id: product.id, user_id: user.id)
    # 住所テーブルの情報
    PurcahseInfo.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, product_user_id: product_user)
  end
end