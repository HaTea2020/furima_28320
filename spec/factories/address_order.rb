FactoryBot.define do
  factory :address_order do
    token {'test_token'}
    postal_code {'123-4567'}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    city {'東京都'}
    house_number {'1-1'}
    building_name {'東京ハイツ'}
    phone_number {0123456789}
  end
end