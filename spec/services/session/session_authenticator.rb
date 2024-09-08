
RSpec.describe SessionJwtEncoder, type: :service do
  let!(:user) { create(:user) }

  it 'creates session when with valid parameters' do
    service = described_class.new(valid_params)
    expect { service.call }.to have_key('token')
  end
end