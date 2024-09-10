# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    role { %w[admin employee].sample }
    password { 'password' }
    password_confirmation { 'password' }
    company { FactoryBot.create(:company) }
  end
end
