FactoryBot.define do
  factory :item do
    name {Faker::Lorem.sentence}
    text {Faker::Lorem.sentence}
    category_id {2}
    status_id {3}
    shipping_fee_id {2}
    prefecture_id {5}
    scheduled_delivery_id {3}
    price{1000}
    association :user

    after(:build) do |i|
      i.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end

  end
end
