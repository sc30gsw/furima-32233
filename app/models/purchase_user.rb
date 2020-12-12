class PurchaseUser

  include ActiveModel::Model
  attr_accessor :nickname, :password, :family_name, :first_name, :family_name_reading, :first_name_reading, :birth, :image, :name, :content, :category_id, :condition_id, :postage_type_id, :delivery_day_id, :price, :postal_code, :prefecture_id, :city, :adress, :building_name, :phone_number, :product_user

  name_validate = /\A[ぁ-んァ-ン一-龥]/
  name_reading_validate = /\A[ァ-ヶー－]+\z/

  with options presence: true do
    #userモデルのバリデーション
    validates :nickname
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i, message: 'is invalid. Input half-width characters' }
    validates :family_name, format: { with: name_validate, message: 'is invalid. Input full-width characters' }
    validates :first_name, format: { with: name_validate, message: 'is invalid. Input full-width characters' }
    validates :family_name_reading, format: { with: name_reading_validate, message: 'is invalid. Input full-width katakana characters' }
    validates :first_name_reading, format: { with: name_reading_validate, message: 'is invalid. Input full-width katakana characters' }
    validates :birth
    #productモデルのバリデーション
    validates :image
    validates :name
    validates :content
    validates :category_id
    validates :condition_id
    validates :postage_type_id
    validates :prefecture_id
    validates :delivery_day_id
    validates :price, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' }
    #purchase_infoモデルのバリデーション
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: 'Is invalid. Input half-width characters'}
    validates :prefecture_id
    validates :city, format: {with: name_validate, message: 'Is invalid. Input full-width characters'}
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: 'Is invalid, Do not need a hyphen'}
    validates :product_user
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :postage_type_id
    validates :prefecture_id
    validates :delivery_day_id
  end

  alidates_inclusion_of :price, in: 300..9_999_999

end