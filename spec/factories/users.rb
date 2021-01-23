FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials }
    email { Faker::Internet.free_email }
    password = '1a' + Faker::Internet.password(min_length: 4)
    password { password }
    password_confirmation { password }
    last_name { Faker::Japanese::Name.last_name }
    first_name { Faker::Japanese::Name.first_name }
    kana_last_name { Faker::Japanese::Name.last_name.yomi }
    kana_first_name { Faker::Japanese::Name.first_name.yomi }
    birthday { Faker::Date.birthday }
  end
end
