FactoryBot.define do
  factory :item do
    name {Faker::Name.last_name}
    explanation {Faker::Lorem.sentence}
    genre_id {Faker::Number.between(from: 2, to: 11)}
    statue_id {Faker::Number.between(from: 2, to: 7)}
    fee_id {Faker::Number.between(from: 2, to: 3)}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    days_id {Faker::Number.between(from: 2, to: 4)}
    price {Faker::Number.between(from: 300, to: 9999999)}
    association :user
  end
end