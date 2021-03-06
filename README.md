# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name | string | null: false |
| first_name | string | null: false |
| kana_last_name | string | null: false |
| kana_first_name | string | null: false |
| birthday | date | null: false |

### Association
- has_many :items
- has_many :orders

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name | string | null: false |
| explain | text | null: false |
| category_id | integer | null: false |
| state_id | integer | null: false |
| burden_id | integer | null: false |
| area_id | integer | null: false |
| delivery_id | integer | null: false |
| price | integer | null: false |
| user | references | foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## orders テーブル

| Column  | Type       | Options    |
| ------- | ---------- | ---------- |
| user | references | foreign_key: true |
| item | references | foreign_key: true |

### Association
- has_one :address
- belongs_to :user
- belongs_to :item

## addresses テーブル

| Column  | Type       | Options    |
| ------- | ---------- | ---------- |
| postal_code | string | null: false |
| prefectures_id | integer | null: false |
| city | string | null: false |
| addresses | string | null: false |
| building | string |               |
| phone_number | string | null: false |
| order | references | foreign_key: true |

### Association
- belongs_to :order
