# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CardCreator, type: :service do
  let!(:user) { create(:user) }
  let(:valid_params) { { last_digits: Faker::Number.between(from: 0o000, to: 9999).to_s, user_id: user.id } }

  it 'creates a card with valid parameters' do
    service = described_class.new(valid_params)

    card = service.call

    expect(card['last_digits']).to eq(valid_params[:last_digits])
  end
end
