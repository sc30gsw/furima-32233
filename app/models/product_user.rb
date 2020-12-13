class ProductUser < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_one :purchase_info

  with_options presence: true do
    validates :product
    validates :user
  end
end
