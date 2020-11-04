# テーブル設計

## usersテーブル

| Column             | Type       | Option      |
|--------------------|------------|-------------|
| nickname           | string     | null: false |
| email              | string     | null: false |
| password           | string     | null: false |
| first_name         | string     | null: false |
| last_name          | string     | null: false |
| first_name_ruby    | string     | null: false |
| last_name_ruby     | string     | null: false |
| birthday           | ActiveHash | null: false |

### Association
- has_many :products
- has_many :purchases
- has_many :comments

## productsテーブル

| Column           | Type         | Option                       |
|------------------|--------------|------------------------------|
| user             | references   | null:false, foreign_key :true|
| image            | string       | null:false                   |
| name             | string       | null:false                   |
| explanation      | text         | null:false                   |
| category         | ActiveHash   | null:false                   |
| condition        | ActiveHash   | null:false                   |
| postage          | ActiveHash   | null:false                   |
| source           | ActiveHash   | null:false                   |
| shipping_day     | ActiveHash   | null:false                   |
| price            | string       | null:false                   |

### Association
- belongs_to :user
- has_one :purchases
- has_many :comments

## purchasesテーブル

| Column  | Type        | Option                        |
|---------|-------------|-------------------------------|
| user    | references  | null:false, foreign_key :true |
| date    | integer     | null:false                    |
| product | references  | null:false                    |
| credit  | オープンAPI  | null:false                    |

- belongs_to :user
- belongs_to :product
- has_one :address

## addressesテーブル

| Column         | Type        | Option      |
|----------------|-------------|-------------|
| postal         | integer     | null:false  |
| prefecture     | ActiveHash  | null:false  |
| city           | string      | null:false  |
| house_number   | string      | null:false  |
| building       | string      |             |
| phone          | integer     | null:false  |

### Association

- belongs_to :purchase

## commentsテーブル

| Column  |  Type      | Option     |
|---------|------------|------------|
| text    | text       | null:false |
| user    | references |            |
| product | references |            |

### Association

- belongs_to :user
- belongs_to :product
