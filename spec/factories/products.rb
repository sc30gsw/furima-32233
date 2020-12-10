FactoryBot.define do
  factory :product do
    name {Faker::Name.name}
    content {Faker::Loerm.sentence}
    category_id {２}
    condition_id {2}
    postage_type_id {2}
    prefecture_id {2}
    delivery_day_id {2}
    price {300}

    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: test_image.png)
    end
  end
end
