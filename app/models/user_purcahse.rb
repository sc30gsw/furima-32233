class UserPurachse
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :adress, :building_name, :phone_number, :product_user

  with options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: 'Is invalid. Input half-width characters'}
    validates :prefecture_id
    validates :city, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: 'Is invalid. Input full-width characters'}
    validates :address, format: {with: /[ -~｡-ﾟ]/, message: "Is invalid. Input full-width characters"}
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: 'Is invalid, Do not need a hyphen'}
    validates :product_user
  end
end