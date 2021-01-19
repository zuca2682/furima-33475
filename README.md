# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | unique: true |
| password | string | null: false |
| last_name | string | null: false |
| first_name | string | null: false |
| kana_last_name | string | null: false |
| kana_first_name | string | null: false |
| year_birth | string | null: false |
| month_birth | string | null: false |
| day_birth | string | null: false |

### Association
- has_many :items
- has_many :orders

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| image |         | null: false |
| name | string | null: false |
| explain | text | null: false |
| category | string | null: false |
| state | string | null: false |
| burden | string | null: false |
| area | string | null: false |
| delivery | string | null: false |
| price | string | null: false |
| user_id | references | foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## orders テーブル

| Column  | Type       | Options    |
| ------- | ---------- | ---------- |
| user_id | references | foreign_key: true |
| item_id | references | foreign_key: true |

### Association
- has_one :address
- belongs_to :user
- belongs_to :item

## addresses テーブル

| Column  | Type       | Options    |
| ------- | ---------- | ---------- |
| postal_code | string | null: false |
| prefectures | string | null: false |
| city | string | null: false |
| address | string | null: false |
| building | string |               |
| phone_number | string | null: false |
| order_id | references | foreign_key: true |

### Association
- belongs_to :order
