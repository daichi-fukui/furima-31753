# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| family_name        | string  | null: false |
| first_name         | string  | null: false |
| family_name_alias  | string  | null: false |
| first_name_alias   | string  | null: false |
| birthday           | date    | null: false |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| name            | string     | null: false       |
| explanation     | text       | null: false       |
| category_id     | integer    | null: false       |
| status_id       | integer    | null: false       |
| delivery_fee_id | integer    | null: false       |
| area_id         | integer    | null: false       |
| date_id         | integer    | null: false       |
| price           | integer    | null: false       |
| user            | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :buyer

## buyers テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## address テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | string  | null: false |
| prefecture_id | integer | null: false |
| municipality  | string  | null: false |
| address       | string | null: false |
| building      | string  |             |
| phone_number  | string  | null: false |

### Association

- belongs_to :buyer
