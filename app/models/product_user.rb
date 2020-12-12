class ProductUser < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_one :purchase_info
end
