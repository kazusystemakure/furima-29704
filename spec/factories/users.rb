FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { '1234abcd' }
    password_confirmation { '1234abcd' }
    first_name { '鈴木' }
    last_name { '一郎' }
    first_name_kana { 'スズキ' }
    last_name_kana { 'イチロウ' }
    birth_date { '19900202' }
  end
end
