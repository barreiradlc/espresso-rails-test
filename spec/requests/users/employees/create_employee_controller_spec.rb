# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateEmployeeController, type: :controller do
  let!(:company) { create(:company) }
  let(:valid_payload) do
    { name: 'John Doe', email: 'john@email.com', password: 'my-password', company_id: company.id }
  end
  let(:valid_payload2) do
    { name: 'Mary Doe', email: 'mary@email.com', password: 'my-password', company_id: company.id }
  end
  let(:invalid_payload) { { email: 'wrong', password: 'wrong' } }

  describe 'POST #employee' do
    before do
      RequestStore[:current_user] = FactoryBot.create(:user, role: :admin)
    end

    context 'with valid payload' do
      it 'returns a valid HTTP response' do
        post :call, params: valid_payload
        expect(response).to have_http_status(:created)
      end

      it 'returns a valid Return response' do
        post :call, params: valid_payload2
        expect(response.parsed_body).not_to be_empty
      end
    end

    context 'with invalid payload' do
      it 'returns an RecordInvalid exception' do
        assert_exception_raised(ActiveRecord::RecordInvalid) do
          post :call, params: invalid_payload
        end
      end
    end
  end
end
