# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UpdateEmployeeController, type: :controller do
  let!(:company) { create(:company) }
  let!(:user) { create(:user, company_id: company.id) }
  let(:update_payload) { { user: { id: user.id, name: 'John Doe', email: 'john@email.com' } } }

  describe 'PUT #employee' do
    before do
      RequestStore[:current_user] = FactoryBot.create(:user, role: :admin)
    end

    context 'with valid payload' do
      it 'returns a valid HTTP response' do
        post :call, params: update_payload
        expect(response).to have_http_status(:ok)
      end

      it 'returns a valid Return response' do
        post :call, params: update_payload
        expect(response.body).not_to be_empty
      end
    end
  end
end
