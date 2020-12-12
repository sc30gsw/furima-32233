class PurchaseAdress
  include ActiveModel:Model
  attr_accessor :nickname, :email, :password, :family_name, :first_name, :family_name_reading, :first_name_reading, :birth, :image, :name, :content, :category_id, :condition_id, :postage_type_id, :delivery_day_id, :price, :postal_code, :prefecture_id, :city, :adress, :building_name, :phone_number, :product_user_id, :product_id, :user_id
  

  name_validate = /\A[ぁ-んァ-ン一-龥]/
  name_reading_validate = /\A[ァ-ヶー－]+\z/
  # バリデーションの処理
  with_options presence: true do
    # ユーザー情報
    validates :nickname
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i, message: 'is invalid. Input half-width characters' }
    validates :family_name, format: { with: name_validate, message: 'is invalid. Input full-width characters' }
    validates :first_name, format: { with: name_validate, message: 'is invalid. Input full-width characters' }
    validates :family_name_reading, format: { with: name_reading_validate, message: 'is invalid. Input full-width katakana characters' }
    validates :first_name_reading, format: { with: name_reading_validate, message: 'is invalid. Input full-width katakana characters' }
    validates :birth
    # 商品情報
    validates :image
    validates :name
    validates :content
    validates :category_id
    validates :condition_id
    validates :postage_type_id
    validates :delivery_day_id
    validates :price, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' }
    # 住所情報
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: 'Is invalid. Input half-width characters'}
    validates :prefecture_id
    validates :city, format: {with: name_validate, message: 'Is invalid. Input full-width characters'}
    validates :address # 番地については可能性が多いため正規表現を用いていない
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: 'Is invalid, Do not need a hyphen'}
    validates :product_user
    validates :product
    validates :user
  end
  
  validates_inclusion_of :price, in: 300..9_999_999

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :postage_type_id
    validates :prefecture_id
    validates :delivery_day_id
  end

  def save
    # ユーザー情報
    user = User.create(nickname: nickname, email: email, password: password, family_name: family_name, first_name: first_name, family_name_reading: family_name_reading, first_name_reading: first_name_reading, birth: birth)
    # 商品情報
    product = Product.create(image: image, name: name, content: content, category_id: category_id, condition_id: condition_id, postage_type_id: postage_type_id, delivery_day_id: delivery_day_id, price: price)
    # 住所テーブルの情報
    PurcahseInfo.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, adress: adress, building_name: building_name, phone_number: phone_number, product_user_id: product_user_id)
    # product_usersテーブルの情報
    ProductUser.create(product_id: product.id, user_id: user.id)
  end
end