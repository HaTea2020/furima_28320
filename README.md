# テーブルの設計

## users テーブル

| Column           | Type     | Options     |
| ---------------  | -------- | ----------- |
| name             | string   | null: false |
| email            | string   | null: false |
| password         | string   | null: false |
| confirm_password | string   | null: false |
| first_name       | string   | null: false |
| last_name        | string   | null: false |
| sub_first_name   | string   | null: false |
| sub_last_name    | string   | null: false |
| birthday         | integer  | null: false |

### Association

- has_many :products
- has_many :addresses

## products テーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| image       | string     | null: false                    |
| name        | string     | null: false                    |
| explanation | text       | null: false                    |
| genre       | integer    | null: false                    |
| statue      | integer    | null: false                    |
| fee         | integer    | null: false                    |
| prefecture  | integer    | null: false                    |
| days        | integer    | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |
| address     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| user          | references | null: false, foreign_key: true |
| product       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product