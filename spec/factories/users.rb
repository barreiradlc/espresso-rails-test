FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    role { ['admin', 'employee'].sample }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
