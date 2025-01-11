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
| category           | integer | null: false|
| sales_status       | integer | null: false|
| shipping_fee_status| integer | null: false|
| prefecture         | integer | null: false|
| scheduled_delivery | integer | null: false|
| price              | integer | null: false|
| user               |references| null: false, foreign_key: true|

### Association
belongs_to :user
has_one :order

## order テーブル
| column             |type    |options      |
|--------------------|--------|-------------|
| item               |references| null: false, foreign_key: true |
| user               |references| null: false, foreign_key: true|


### Association
belongs_to :item
belongs_to :user

##　Address 　テーブル
| column             |type    |options      |
|--------------------|--------|-------------|
| user               |references| null: false, foreign_key: true |
| postal_code        | string | null: false |
| street_address     | string | null: false |
| city               | string | null: false |
| prefecture         | string | null: false |
| addresses          | string | null: false |
| building           | string | mull: true  | 
| phone_number       | string | null: false |

### Association
belongs_to : order