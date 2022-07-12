FactoryBot.define do
  factory :item do
    name {"あああ"}
    explanation {"あああああ"}
    condition_id {2}
    price {1000}
    category_id {2}
    prefecture_id {2}
    charge_id {2}
    delivery_time_id {2}
    association :user 
  end
end
