FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { '123123123' }
    name { Faker::Name.name }
  end
end
