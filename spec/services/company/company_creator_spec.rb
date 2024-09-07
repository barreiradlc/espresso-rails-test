require 'rails_helper'

RSpec.describe CompanyCreator, type: :service do
  let(:valid_params) { { name: "Test Company", cnpj: Faker::Number.number(digits: 14) } }

  it "creates a company with valid parameters" do
    service = CompanyCreator.new(valid_params)
    expect { service.call }.to change(Company, :count).by(1)
  end
end
