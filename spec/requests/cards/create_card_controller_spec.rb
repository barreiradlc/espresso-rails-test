# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateCardController do
  let!(:user) { create(:user) }
  let(:valid_payload) { { last_digits: Faker::Number.between(from: 1000, to: 9999).to_s, user_id: user.id } }

  describe 'POST /cards' do
    before do
      RequestStore[:current_user] = FactoryBot.create(:user, role: :admin)
    end

    context 'with valid payload' do
      it 'returns a valid Return response' do
        post '/card', params: valid_payload
        expect(response.parsed_body).not_to be_empty
      end
    end
  end
end
