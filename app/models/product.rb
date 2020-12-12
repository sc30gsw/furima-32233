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

  with_options presence: true do
    validates :image
    validates :name
    validates :content
    validates :category_id
    validates :condition_id
    validates :postage_type_id
    validates :prefecture_id
    validates :delivery_day_id
    validates :price, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' }
  end

  validates_inclusion_of :price, in: 300..9_999_999

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :postage_type_id
    validates :prefecture_id
    validates :delivery_day_id
  end
end
