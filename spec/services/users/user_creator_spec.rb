require 'rails_helper'

RSpec.describe UserCreator, type: :service do
  let(:valid_params) { { name: "Test User", email: "test@example.com", password: "my-secret-password" } }

  it "creates a user with valid parameters" do
    service = UserCreator.new(valid_params)
    expect { service.call }.to change(User, :count).by(1)
  end
end
