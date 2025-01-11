#テーブル設計

## user  テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| name               | string | null: false |


### Association

has_many :item
has_many :order

## item  テーブル
| column             |type    |options      |
|--------------------|--------|-------------|
| name               | string | null: false |
| description        | text   | null: false |
| price              | integer | null: false |
| user_id            | integer | null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :order

## order テーブル
| column             |type    |options      |
|--------------------|--------|-------------|
| item_id            | integer | null: false, foreign_key: true |
| user_id            | integer | null: false, foreign_key: true|
| status             | string  | null: false |

### Association
belongs_to :item
belongs_to :user

##　Address 　テーブル
| column             |type    |options      |
|--------------------|--------|-------------|
| user_id            | integer | null: false, foreign_key: true |
| postal_code        | string | null: false |
| street_address     | string | null: false |
| city               | string | null: false |
| state              | string | null: false |
| country            | string | null: false |

### Association
belongs_to : order
belongs_to :user