# frozen_string_literal: true

RSpec.describe SessionJwtEncoder, type: :service do
  it 'creates session when with valid parameters' do
    service = described_class.new(valid_params)
    expect { service.call }.to have_key('token')
  end
end
