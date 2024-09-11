# frozen_string_literal: true

require 'rails_helper'
# Faker::Number.between(from: 900000000, to: 999999999)
RSpec.describe CardCreator, type: :service do
  let(:card_payload) { { last_digits: Faker::Number.between(from: 0o000, to: 9999).to_s } }

  it 'created a card with valid paramethers' do
    service = described_class.new(card_payload)

    card_created = service.call

    expect(card_created['last_digits']).to eq(card_payload[:last_digits])
  end
end
