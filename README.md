## usersテーブル
| name               | string | option                   |
| ------------------ | ------ | ------------------------ |
| email              | string | null: false unique: true |
| encrypted_password | string | null: false              |
| nickname           | string | null: false              |
| last_name          | string | null: false              |
| first_name         | string | null: false              |
| kana_last_name     | string | null: false              |
| kana_first_name    | string | null: false              |
| birthday           | date   | null: false              |

has_many :items
has_many :purchases

## itemsテーブル
| name             | string     | option                        |
| ---------------- | ---------- | ----------------------------- |
| name             | string     | null: false                   |
| explanation      | text       | null: false                   |
| condition_id     | integer    | null: false                   |
| price            | integer    | null: false                   |
| category_id      | integer    | null: false                   |
| user             | references | null: false foreign_key :true |
| prefecture_id    | integer    | null: false                   |
| charge_id        | integer    | null: false                   |
| delivery_time_id | integer    | null: false                   |

belongs_to :user
has_one :purchase

## purchasesテーブル
| name | string     | option                        |
| ---- | ---------- | ----------------------------- |
| user | references | null: false foreign_key :true |
| item | references | null: false foreign_key :true |

belongs_to :user
belongs_to :item
has_one :address

## addressesテーブル
| name          | string  | option      |
| ------------- | ------- | ----------- |
| postal_code   | string  | null: false |
| city          | string  | null: false |
| address       | string  | null: false |
| prefecture_id | integer |             |
| building      | string  |             |
| phone_number  | string  | null:false  |

belongs_to :purchase