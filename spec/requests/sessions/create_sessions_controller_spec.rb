# spec/requests/sessions_controller_spec.rb
require 'rails_helper'

RSpec.describe CreateSessionController, type: :controller do
  let!(:user) { create(:user) }
  let(:valid_credentials) { { email: user.email, password: user.password } }
  let(:invalid_credentials) { { email: 'wrong', password: 'wrong' } }

  describe 'POST #login' do
    context 'with valid credentials' do
      it 'returns an auth token' do
        post :call, params: valid_credentials
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)).to have_key('token')
      end
    end

    context 'with invalid credentials' do
      it 'returns an unauthorized status' do
        post :call, params: invalid_credentials
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end