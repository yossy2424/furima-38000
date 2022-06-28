FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name {"佐藤"}
    first_name {"一郎"}
    kana_last_name {"サトウ"}
    kana_first_name {"イチロウ"}
    birthday {Faker::Date.birthday}
  end
end