# frozen_string_literal: true

RSpec.describe SessionJwtEncoder, type: :service do
  let!(:user) { FactoryBot.create(:user) }

  it 'creates session when with valid parameters' do
    service = described_class.new(user_id: user.id)
    expect(service.call).to be_an_instance_of(String)
  end
end
