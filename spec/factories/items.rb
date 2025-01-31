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
    trait :with_image do
      after(:build) do |item|
        item.image.attach(
          io: File.open(Rails.root.join('spec/test/sample.jpg')),
          filename: 'sample.jpg',
          content_type: 'image/jpeg'
        )
      end
    end
  end
end
