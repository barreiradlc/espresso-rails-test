# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoryCreator, type: :service do
  let(:valid_params) { { name: 'Test category' } }

  describe 'Admin creating category' do
    before do
      RequestStore[:current_user] = FactoryBot.create(:user, role: :admin)
    end

    it 'creates a category with valid parameters' do
      service = described_class.new(valid_params)
      expect { service.call }.to change(Category, :count).by(1)
    end

    it 'Does not create a category with same name' do
      Category.create!(valid_params)

      expect do
        described_class.new(valid_params).call
      end.to raise_error(ActiveRecord::RecordInvalid, /Name has already been taken/)
    end
  end
end
