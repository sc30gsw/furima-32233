class PurchaseInfo < ApplicationRecord
  belongs_to :product_user
  belongs_to :prefecture
end
