class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :product

  name_validate = /\A[ぁ-んァ-ン一-龥]/
  name_reading_validate = /\A[ァ-ヶー－]+\z/

  with_options presence: true do
    validates :nickname
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i, message: 'is invalid. Input half-width characters' }
    validates :family_name, format: { with: name_validate, message: 'is invalid. Input full-width characters' }
    validates :first_name, format: { with: name_validate, message: 'is invalid. Input full-width characters' }
    validates :family_name_reading, format: { with: name_reading_validate, message: 'is invalid. Input full-width katakana characters' }
    validates :first_name_reading, format: { with: name_reading_validate, message: 'is invalid. Input full-width katakana characters' }
    validates :birth
  end
end
