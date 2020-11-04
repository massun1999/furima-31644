# テーブル設計

## usersテーブル

| Column             | Type       | Option      |
|--------------------|------------|-------------|
| nickname           | string     | null: false |
| email              | string     | null: false |
| encrypted_password | string     | null: false |
| first_name         | string     | null: false |
| last_name          | string     | null: false |
| first_name_ruby    | string     | null: false |
| last_name_ruby     | string     | null: false |
| birthday           | date       | null: false |

### Association
- has_many :products
- has_many :purchases
- has_many :comments

## productsテーブル

| Column           | Type         | Option                       |
|------------------|--------------|------------------------------|
| user             | references   | null:false, foreign_key :true|
| name             | string       | null:false                   |
| explanation      | text         | null:false                   |
| category_id      | integer      | null:false                   |
| condition_id     | integer      | null:false                   |
| postage_id       | integer      | null:false                   |
| source_id        | integer      | null:false                   |
| shipping_day_id  | integer      | null:false                   |
| price            | integer      | null:false                   |

### Association
- belongs_to :user
- has_one :purchase
- has_many :comments

## purchasesテーブル

| Column  | Type        | Option                        |
|---------|-------------|-------------------------------|
| user    | references  | null:false, foreign_key :true |
| product | references  | null:false, foreign_key :true |

- belongs_to :user
- belongs_to :product
- has_one :address

## addressesテーブル

| Column         | Type        | Option                       |
|----------------|-------------|------------------------------|
| postal         | string      | null:false                   |
| prefecture_id  | integer     | null:false                   |
| city           | string      | null:false                   |
| house_number   | string      | null:false                   |
| building       | string      |                              |
| phone          | string      | null:false                   |
| purchases      | references  | null:false, foreign_key :true|

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
