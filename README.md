# テーブルの設計

## users テーブル

| Column           | Type     | Options     |
| ---------------  | -------- | ----------- |
| nickname         | string   | null: false |
| email            | string   | null: false |
| password         | string   | null: false |
| confirm_password | string   | null: false |
| first_name       | string   | null: false |
| last_name        | string   | null: false |
| sub_first_name   | string   | null: false |
| sub_last_name    | string   | null: false |
| birthday         | date     | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| image         | string     | null: false                    |
| name          | string     | null: false                    |
| explanation   | text       | null: false                    |
| genre_id      | integer    | null: false                    |
| statue_id     | integer    | null: false                    |
| fee_id        | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| days_id       | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :address
- has_one :order

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :item


### order テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item

<!-- #hoge -->