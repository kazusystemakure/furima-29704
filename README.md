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
| category              | integer    | null: false                    |
| status                | integer    | null: false                    |
| shipping_fee          | integer    | null: false                    |
| prefecture            | integer    | null: false                    |
| scheduled_delivery    | integer    | null: false                    |
| price                 | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase



## purchases テーブル
| user                  | references | null: false, foreign_key: true |
| item                  | references | null: false, foreign_key: true |

### Association
- belongs_to user
- belongs_to item
- has_one :order



## orders テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| post_code             | string     | null: false                    |
| prefecture            | integer    | null: false                    |
| city                  | string     | null: false                    |
| address               | string     | null: false                    |
| building              | integer    |                                |
| phone_number          | string     | null: false                    |
| purchase              | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase