FactoryBot.define do
  factory :item do
    association :user
    name { 'サンプル' }
    description { 'サンプル' }
    category_id { 2 }
    condition_id { 2 }
    shipping_cost_id { 2 }
    prefecture_id { 2 }
    shipping_time_id { 2 }
    price { 500 }

    # 画像ありのアイテム
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample.jpg'), filename: 'sample.jpg')
    end
  end
end
