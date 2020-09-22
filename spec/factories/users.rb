FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    first_name { '鈴木' }
    last_name { '一郎' }
    first_name_kana { 'スズキ' }
    last_name_kana { 'イチロウ' }
    birth_date { '19900202' }
  end
end
