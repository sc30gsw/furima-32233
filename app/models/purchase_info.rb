class PurchaseInfo < ApplicationRecord
  belongs_to :product_user
  belongs_to :prefecture

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Input three-digit number, hyphen, four-digit number'}
    validates :prefecutre_id
    validates :city, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters'}
    validates :adress #番地については様々な可能性があるため正規表現は用いない
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: 'is invalid. Input do not need hyphen'}
    validates :product_user
  end
end
