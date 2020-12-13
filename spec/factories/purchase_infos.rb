FactoryBot.define do
  factory :purchase_info do
    postal_code {"111-1111"}
    prefecture_id {2}
    city {"東京都"}
    address {"2-2"}
    phone_number {"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
