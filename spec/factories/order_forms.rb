FactoryBot.define do
  factory :order_form do
    postal_code { "123-4567" }
    prefecture_id { 1 }
    city { "渋谷区" }
    address { "渋谷109" }
    building_name { "渋谷ビル101" }
    phone_number { "09012345678" }
    token { "tok_abcdefghijk00000000000000000" }
  end
end