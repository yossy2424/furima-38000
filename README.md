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
| name          | string     | option                        |
| ------------- | ---------- | ----------------------------- |
| name          | string     | null: false                   |
| explanation   | text       | null: false                   |
| condition_id  | integer    | null: false                   |
| price         | integer    | null: false                   |
| category_id   | integer    | null: false                   |
| user          | references | null: false foreign_key :true |
| prefecture_id | integer    | null: false                   |
| charge_id     | integer    | null: false                   |
| days_id       | integer    | null: false                   |

belong_to :user
has_one :purchase

## purchasesテーブル
| name | string     | option                        |
| ---- | ---------- | ----------------------------- |
| user | reference  | null: false foreign_key :true |
| name | references | null: false foreign_key :true |

belong_to :user
belong_to :item
has_one :address

## addressesテーブル
| name          | string  | option      |
| ------------- | ------- | ----------- |
| postal_code   | string  | null: false |
| city          | string  | null: false |
| address       | string  | null: false |
| prefecture_id | integer |             |
| building      | integer |             |
| phone_number  | integer | null:false  |

belong_to :purchase