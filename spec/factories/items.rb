FactoryBot.define do
  factory :item do
    image { Faker::Lorem.sentence}
    name { Faker::Food.dish }
    explain { Faker::Food.description }
    category_id { Faker::Number.between(from: 2, to: 11) }
    state_id { Faker::Number.between(from: 2, to: 7) }
    burden_id { Faker::Number.between(from: 2, to: 3) }
    area_id { Faker::Number.between(from: 2, to: 48) }
    delivery_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 9999999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_iamge.png')
    end
  end
end
