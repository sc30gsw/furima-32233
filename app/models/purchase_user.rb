class PurchaseUser

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :adress, :building_name, :phone_number, :product_user

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: 'Is invalid. Input half-width characters'}
    validates :prefecture_id
    validates :city, format: {with: name_validate, message: 'Is invalid. Input full-width characters'}
    validates :address # 番地については可能性が多いため正規表現を用いていない
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: 'Is invalid, Do not need a hyphen'}
    validates :product_user
  end
  
  def save
  end
end