# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DeleteEmployeeController, type: :controller do
  let!(:company) { create(:company) }
  let!(:user) { create(:user, company_id: company.id) }
  let(:delete_payload) { { id: user.id } }

  describe 'DELETE #employee' do
    before do
      RequestStore[:current_user] = FactoryBot.create(:user, role: :admin)
    end

    context 'with valid payload' do
      it 'returns a valid HTTP response' do
        put :call, params: delete_payload
        expect(response).to have_http_status(:no_content)
      end

      it 'returns a valid Return response' do
        put :call, params: delete_payload
        expect(response.body).to be_empty
      end
    end
  end
end
