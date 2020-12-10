FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email    { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name { '山田' }
    first_name { '太郎' }
    family_name_reading { 'ヤマダ' }
    first_name_reading { 'タロウ' }
    birth { '1990/1/1' }
  end
end
