FactoryBot.define do
  factory :category do
    name { ['Lanche', 'Conta fixas', 'Contas variáveis', 'Cartão'].sample } 
    description { Faker::Commerce.product_name }
    transaction { Transaction.first || FactoryBot.create(:transaction) }
  end
end
