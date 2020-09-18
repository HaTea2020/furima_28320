# アプリケーション名
  フリマアプリ

# サイトURL
 https://furima-28320.herokuapp.com/

# ID/pass
 * ID: admin
 * Pass: 2222
# テスト用アカウント等
 * 購入者用
   * メールアドレス: test_buyer@gmail.com
   * パスワード: buy117
 * 購入用カード情報
   * 番号：4242424242424242
   * 期限：25年10月
   * セキュリティコード：123
 * 出品者用
   * メールアドレス名: test_seller@gmail.com
   * パスワード: sell117

# 工夫した点
 常に、自分が業務の一貫でこのアプリケーションを開発しているという前提で開発に取り組むようにしました。具体的には、機能毎に時間を設けて進めていき、その日やる事を決めながら開発致しました。
そして今やっていることを明確に理解する為に何が分からなかったか、どうやって解決したかをノートに書き込んでいきました。以上の行動によってどこが得意で、またどこが苦手で復習しなければならない所なのかが明確になり勉強すべき点が明確になりました。

# 苦労した点
 Payjpでの決済機能を追加する時にエラー文も出ず、固まってしまい大変苦労致しました。
エラー文が出なかった為インターネットで探す事もできませんでした。その為binding.pryを細かくかけて処理を一時停止させ、今どこまでデータが行っているかを確認しました。するとトークンだけがjavascriptで止まっている事が分かり修正することが出来ました。悩んだ時間は長かったですが自分で解決する事ができ、とても自信に繋がりました。今後も開発中にエラーが出てしまっても焦らず、よくコードを確認して解決出来るようにしたいと思います。
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

