# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoryUpdater, type: :service do
  let(:category) { create(:category) }
  let(:new_params) { { name: 'Another test category' } }

  it 'update a category with valid parameters' do    
    service = described_class.new(category[:id], new_params)

    new_category = service.call

    expect(new_category[:name]).to eq(new_params[:name])
  end

  it 'Does not update a category with same name as another' do
    new_category_created = Category.create!(new_params)

    expect do
      described_class.new(category[:id], new_params).call
    end.to raise_error(ActiveRecord::RecordInvalid, /Name has already been taken/)
  end
end
