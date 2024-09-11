# frozen_string_literal: true

FactoryBot.define do
  factory :card do
    last_digits { Faker::Number.between(from: 0o000, to: 9999) }
  end
end
