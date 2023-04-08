FactoryBot.define do
  factory :source do
    user { User.first || FactoryBot.create(:user) }
    name { ['Banco', 'Caixa', 'Dinheiro', 'Cartão'].sample } 
  end
end
