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
| birthday           | integer | null: false |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| name         | string     | null: false       |
| explanation  | text       | null: false       |
| category     | string     | null: false       |
| status       | string     | null: false       |
| delivery_fee | integer    | null: false       |
| area         | string     | null: false       |
| price        | integer    | null: false       |
| user         | references | foreign_key: true |

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

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| postal_code  | integer | null: false |
| prefecture   | string  | null: false |
| municipality | string  | null: false |
| address      | integer | null: false |
| building     | string  |             |
| phone_number | integer | null: false |

### Association

- belongs_to :buyer
