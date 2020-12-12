class PurchaseUser

  include ActiveModel::Model
  attr_accessor :nickname, :password, :family_name, :first_name, :family_name_reading, :first_name_reading, :birth, :image, :name, :content, :category_id, :condition_id, :postage_type_id, :delivery_day_id, :price, :postal_code, :prefecture_id, :city, :adress, :building_name, :phone_number, :product_user
end