class Product < ApplicationRecord
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
