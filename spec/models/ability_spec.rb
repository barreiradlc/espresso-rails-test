# frozen_string_literal: true

require 'rails_helper'
require 'cancan/matchers'

RSpec.describe Ability do
  let(:admin) { FactoryBot.create(:user, role: :admin) }
  let(:employee) { FactoryBot.create(:user, role: :employee) }
  let(:category) { Category.create!(name: 'Test Category', user: employee) }

  describe 'Admin abilities' do
    before(:all) do
      $current_user = create(:user, role: :admin)
    end

    it 'can manage all' do
      ability = described_class.new(admin)
      expect(ability).to be_able_to(:manage, :all)
    end
  end

  describe 'Employee abilities' do
    before(:all) do
      $current_user = create(:user, role: :employee)
    end

    it 'can update category' do      
      ability = described_class.new(employee)
      expect(ability).to be_able_to(:update, Category)
    end

    it 'cannot create category' do
      ability = described_class.new(employee)
      expect(ability).not_to be_able_to(:create, Category)
    end
  end
end
