# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserEmployeeCreator, type: :service do
  let(:valid_params) { { name: 'Test User', email: Faker::Internet.email, password: 'my-secret-password' } }

  it 'creates a user with valid parameters' do
    service = described_class.new(valid_params)
    
    employee_created = service.call

    expect(employee_created['email']).to eq(valid_params[:email])
  end
end
