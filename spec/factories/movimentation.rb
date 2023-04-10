FactoryBot.define do
  factory :movimentation do
    operation { [0,1].sample }
    description { Faker::Commerce.product_name }
    value { Faker::Number.between(from: 1.0, to: 2000.0) }
    user { User.first || FactoryBot.create(:user) }
    source { Source.first || FactoryBot.create(:user) }
    date_transaction { Date.today }
  end
end
