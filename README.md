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
| date                | integer | null: false | 

### Association

- has_many :products
- has_many :purchase_info
- has_one  :item_users

## productsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ | 
| name          | string     | null: false                    |
| content       | text       | null: false                    |
| category      | integer    | null: false                    |
| condition     | integer    | null: false                    |
| postage_type  | integer    | null: false                    |
| prefecture    | integer    | null: false                    |
| delivery_days | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to          :user
- has_one_active_hash :category
- has_one_active_hash :postage_type
- has_one_active_hash :prefecture
- has_one_active_hash :delivery_days
- has_one             :item_users

## purchase_infoテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | integer    | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| product       | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :product
- has_one_active_hash :prefecture

## item_usersテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item_id | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :product
- belongs_to :user