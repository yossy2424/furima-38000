FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    prefecture_id { 3 }
    city { '横浜市緑区' }
    address { '青山1-1' }
    building { 'あああ' }
    phone_number { '09012345678'}
    token {"tok_abcdefghijk00000000000000000"}
    item_id { 3 }
  end
end
