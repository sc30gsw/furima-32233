FactoryBot.define do
  factory :user do
    nickname {"test"}
    email    {"test@test.com"}
    password {"111aaa"}
    password_confirmation {password}
    family_name {"山田"}
    first_name {"太郎"}
    family_name_reading {"ヤマダ"}
    first_name_reading {"タロウ"}
    birth {"1990/1/1"}
  end
end
