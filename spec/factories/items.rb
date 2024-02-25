FactoryBot.define do
  factory :item do
    association :user # ItemがUserに属していることを想定

    name { "テストアイテム" }
    description { "これはテスト用のアイテムです。" }
    category_id { 1 }
    condition_id { 1 }
    shipping_charge_id { 1 }
    prefecture_id { 1 }
    days_to_ship_id { 1 }
    price { 500 }

    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/sample.png'), filename: 'sample.png', content_type: 'image/png')
    end
  end
end