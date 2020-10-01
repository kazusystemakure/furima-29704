FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture { 2 }
    city { '札幌市' }
    address { '札幌1-1' }
    phone_number { '09012345678' }
    token {'123456789abcdef'}
    association :user
    association :item 
  end
end