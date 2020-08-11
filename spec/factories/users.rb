FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 8)
    password {password}
    password_confirmation {password}
    first_name {Gimei.last.kanji}
    last_name {Gimei.first.kanji}
    sub_first_name {Gimei.last.katakana}
    sub_last_name {Gimei.first.katakana}
    birthday {Date.today}
  end
end