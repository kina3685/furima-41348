#テーブル設計

## users  テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name          | string	| null: false |
| first_name	       | string	| null: false |
| last_name_kana	   | string	| null: false |
| first_name_kana    | string	| null: false |
| birth_date	       |date	  | null: false |
### Association

has_many :items
has_many :orders

## items  テーブル
| column             |type    |options      |
|--------------------|--------|-------------|
| name               | string | null: false |
| description        | text   | null: false |
| category_id        | integer | null: false|
| condition_id       | integer | null: false|
| shipping_cost_id   | integer | null: false|
| prefecture_id      | integer | null: false|
| shipping_time_id   | integer | null: false|
| price              | integer | null: false|
| user               |references| null: false, foreign_key: true|

### Association
belongs_to :user
has_one :order

## orders テーブル
| column             |type    |options      |
|--------------------|--------|-------------|
| item               |references| null: false, foreign_key: true |
| user               |references| null: false, foreign_key: true| 


### Association
belongs_to :item
belongs_to :user
has_one :address


## 　addresses 　テーブル
| column             |type    |options      |
|--------------------|--------|-------------|
| order              |references| null: false, foreign_key: true |
| postal_code        | string | null: false |
| street_address     | string | null: false |
| city               | string | null: false |
| prefecture_id      |integer | null: false |
| addresses          | string | null: false |
| building           | string |
| phone_number       | string | null: false |

### Association
belongs_to : order
