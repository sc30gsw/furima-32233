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

- has_many :item_users

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

- belongs_to          :user
- has_one_active_hash :category_id
- has_one_active_hash :postage_type_id
- has_one_active_hash :prefecture_id
- has_one_active_hash :delivery_day_id
- has_one             :item_user

## purchase_infoテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |

### Association

- has_one :item_user
- has_one_active_hash :prefecture_id

## item_usersテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :product
- belongs_to :user
- belongs_to :purchase_info