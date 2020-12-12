class PurchaseUser
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :adress, :building_name, :phone_number, :product_user

  with options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: 'Is invalid. Input half-width characters'}
    validates :prefecture_id
    validates :city, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: 'Is invalid. Input full-width characters'}
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: 'Is invalid, Do not need a hyphen'}
    validates :product_user
  end

  def save
    user = User.create(nickname: nickanem, password: password, family_name: family_name, first_name: first_name, family_name_reading: family_name_reading, first_name_reading: first_name_reading, birth: birth )
    product = Product.create(image: image, name: name, content: content, category_id: category_id, condition_id: condition_id, postage_type_id: postage_type_id, prefecture_id: prefecture_id, delivery_day_id: delivery_day_id, price: price)
    PurchaseInfo.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city. adress: adress, building_name: building_name, phone_number: phone_number, user_id: user.id, product_id: product.id)
  end
end