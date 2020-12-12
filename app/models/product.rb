class Product < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :product_user
  belongs_to :category
  belongs_to :condition
  belongs_to :postage_type
  belongs_to :prefecture
  belongs_to :delivery_day
  has_one_attached :image
  
end
