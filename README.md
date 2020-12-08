# テーブル設計

## usersテーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| nickname     | string  | null: false |   
| email        | string  | null: false |  
| password     | string  | null: false | 
| name         | string  | null: false | 
| name_reading | string  | null: false | 
| birth        | integer | null: false | 

### Association

- has_many :products
- has_many :purchase_info

## productsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ | 
| name          | string     | null: false                    |
| content       | text       | null: false                    |
| category      | integer    | null: false                    |
| postage_type  | integer    | null: false                    |
| prefecture    | integer    | null: false                    |
| delivery_days | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one_active_hash :category
- has_one_active_hash :postage_type
- has_one_active_hash :prefecture
- has_one_active_hash :delivery_days

## purchase_infoテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| card_data     | integer    | null: false                    |
| card_deadline | integer    | null: false                    |
| security_code | integer    | null: false                    |
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