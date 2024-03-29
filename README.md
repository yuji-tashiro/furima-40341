# テーブル設計

## users テーブル

| Column              | Type   | Options                   |
|---------------------|--------|---------------------------|
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| first_name          | string | null: false               |
| last_name           | string | null: false               |
| first_name_kana     | string | null: false               |
| last_name_kana      | string | null: false               |
| birthday            | date   | null: false               |

has_many :items
has_many :orders

## items テーブル

| Column              | Type       | Options                        |
|---------------------|------------|--------------------------------|
| name                | string     | null: false                    |
| description         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| condition_id        | integer    | null: false                    |
| shipping_charge_id  | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| days_to_ship_id     | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

- belongs_to :user
- has_one :order
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_charge
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :days_to_ship

## orders テーブル

| Column   | Type       | Options                        |
|----------|------------|--------------------------------|
| item     | references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| order           | references | null: false, foreign_key: true |
| postal_code     | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |

- belongs_to :order
- belongs_to_active_hash :prefecture