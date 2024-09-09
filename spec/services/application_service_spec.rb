# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationService, type: :service do
  describe 'Deal with role permissions' do
    before do
      RequestStore[:current_user] = FactoryBot.create(:user, role: :employee)
    end

    it "Retrieves an issue when there's no permission to acess resource" do
      Category.create(name: 'My category')

      expect do
        described_class.new(:create, Category)
      end.to raise_error(CanCan::AccessDenied)
    end
  end

  describe 'Invalid user NO permissions' do
    before do
      RequestStore[:current_user] = FactoryBot.create(:user, role: nil)
    end

    it "Retrieves an issue when there's no permission to acess resource" do
      Category.create(name: 'My category')

      expect do
        described_class.new(:create, Category)
      end.to raise_error(CanCan::AccessDenied)
    end
  end
end
