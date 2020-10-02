# テーブル設計

## users テーブル

| Column                | Type    | Options     |
| --------------------- | ------  | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| encrypted_password    | string  | null: false |
| first_name            | string  | null: false |
| last_name             | string  | null: false |
| first_name_kane       | string  | null: false |
| last_name_kane        | string  | null: false |
| birth_date            | date    | null: false |

### Association
- has_many :items
- has_many :purchases



## items テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| name                  | string     | null: false                    |
| text                  | string     | null: false                    |
| category_id           | integer    | null: false                    |
| status_id             | integer    | null: false                    |
| shipping_fee_id       | integer    | null: false                    |
| prefecture_id         | integer    | null: false                    |
| scheduled_delivery_id | integer    | null: false                    |
| price                 | integer    | null: false                    |
| user_id               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase



## orders テーブル

| user_id             | references | null: false, foreign_key: true |
| item_id             | references | null: false, foreign_key: true |

### Association
- belongs_to user
- belongs_to item
- has_one :order



## address テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| postal_code             | string     | null: false                    |
| prefecture            | integer    | null: false                    |
| city                  | string     | null: false                    |
| address               | string     | null: false                    |
| building              | integer    |                                |
| phone_number          | string     | null: false                    |
| order_id              | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase