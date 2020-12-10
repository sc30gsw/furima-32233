# テーブル設計

## usersテーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| nickname            | string  | null: false |   
| email               | string  | null: false |  
| encrypted_password  | string  | null: false | 
| family_name         | string  | null: false |
| first_name          | string  | null: false | 
| family_name_reading | string  | null: false | 
| first_name_reading  | string  | null: false |
| birth               | date    | null: false | 

### Association

- has_many :products
- has_many :product_users

## productsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ | 
| name             | string     | null: false                    |
| content          | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| postage_type_id  | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| delivery_day_id  | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to             :user
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :postage_type
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :delivery_day
- has_one                :product_user

## purchase_infoテーブル

| Column        | Type       | Options                           |
| ------------- | ---------- | --------------------------------- |
| postal_code   | string     | null: false                       |
| prefecture_id | integer    | null: false                       |
| city          | string     | null: false                       |
| address       | string     | null: false                       |
| building_name | string     |                                   |
| phone_number  | string     | null: false                       |
| product_user  | references | null: false, foreign_key: true    |
### Association

- belongs_to :product_user

## product_usersテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| product | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :product
- belongs_to :user
- has_one    :purchase_info
