# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserEmployeeUpdater, type: :service do
  let!(:user) { create(:user) }
  let(:new_params) { { name: 'Test User', email: Faker::Internet.email, password: 'my-secret-password' } }

  context 'when change a user paramethers' do
    it 'change name' do
      service = described_class.new(user.id, new_params)

      employee_updated = service.call

      expect(employee_updated['name']).to eq(new_params[:name])
    end

    it 'change email' do
      service = described_class.new(user.id, new_params)

      employee_updated = service.call

      expect(employee_updated['email']).to eq(new_params[:email])
    end
  end
end
