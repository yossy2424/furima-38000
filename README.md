## usersテーブル
| name               | string  | option                   |
| ------------------ | ------- | ------------------------ |
| email              | string  | null: false unique: true |
| encrypted_password | string  | null: false              |
| nickname           | string  | null: false              |
| last_name          | string  | null: false              |
| first_name         | string  | null: false              |
| kana_last_name     | string  | null: false              |
| kana_first_name    | string  | null: false              |
| birthday           | integer | null: false              |

has_many :items
has_many :purchases
has_many :address

## itemsテーブル
| name          | string    | option                        |
| ------------- | --------- | ----------------------------- |
| name          | string    | null: false                   |
| text          | text      | null: false                   |
| condition     | integer   | null: false                   |
| price         | integer   | null: false                   |
| category      | integer   | null: false                   |
| buyer_id      | reference | null: false foreign_key :true |
| seller_id     | reference | null: false foreign_key :true |
| prefecture_id | integer   |                               |

belong_to :users
has_one :purchases
belong_to :addresses

## purchasesテーブル
| name  | string     | option                        |
| ----- | ---------- | ----------------------------- |
| buyer | references | null: false foreign_key :true |
| name  | references | null: false foreign_key :true |

belong_to :users
belong_to :items
has_one :address

## addressesテーブル
| name            | string    | option            |
| --------------- | --------- | ----------------- |
| last_name       | string    | null: false       |
| first_name      | string    | null: false       |
| kana_last_name  | string    | null: false       |
| kana_first_name | string    | null: false       |
| postal_code     | string    | null: false       |
| city            | string    | null: false       |
| block           | string    | null: false       |
| user_id         | reference | foreign_key :true |
| prefecture_id   | integer   |                   |

belong_to :purchases
belong_to :users
belong_to :purchases