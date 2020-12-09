class Product < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :pastage_type
  belongs_to :prefecture
  belongs_to :delivery_day
  
  with_options presence: true do
    validates :name
    validates :content
    validates :category_id
    validates :condition_id
    validates :postage_type_id
    validates :preefcture_id
    validates :delivery_day_id
    validates :price
  end
end
