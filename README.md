# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| username           | string | null: false               |
| profile            | text   |                           |

- has_many :items
- has_many :orders
- has_many :shipping_addresses

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| description  | text       | null: false                    |
| price        | integer    | null: false                    |
| seller_id    | references | null: false, foreign_key: true |

- belongs_to :user
- has_one :order

## orders テーブル

| Column    | Type       | Options                        |
|-----------|------------|--------------------------------|
| item_id   | references | null: false, foreign_key: true |
| buyer_id  | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user_id        | references | null: false, foreign_key: true |
| order_id       | references | null: false, foreign_key: true |
| postal_code    | string     | null: false                    |
| prefecture     | string     | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |

- belongs_to :order
- belongs_to :user