require 'rails_helper'

RSpec.describe CategoryCreator, type: :service do
  let(:valid_params) { { name: "Test category" } }

  it "creates a category with valid parameters" do
    service = CategoryCreator.new(valid_params)
    expect { service.call }.to change(Category, :count).by(1)
  end

  it "Does not create a category with same name" do
    service = CategoryCreator.new(valid_params)
    other_service = CategoryCreator.new(valid_params)

    service.call
    
    expect(other_service.call).to raise_error(ActiveRecord::RecordInvalid)
  end
end
