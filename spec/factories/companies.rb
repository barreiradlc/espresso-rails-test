FactoryBot.define do
  factory :company do
    name { Faker::Name.name }
    cnpj { Faker::Number.number(digits: 14) }
  end
end
