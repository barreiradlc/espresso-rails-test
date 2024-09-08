# frozen_string_literal: true

require 'rails_helper'
require 'cancan/matchers'

RSpec.describe EmployeeAbility, type: :model do
  let(:admin) { FactoryBot.create(:user, role: :admin) }
  let(:employee) { FactoryBot.create(:user, role: :employee) }

  describe 'Employee abilities' do
    it 'can read categories' do
      ability = described_class.new(employee)
      expect(ability).to be_able_to(:read, Category)
    end

    it 'can update categories' do
      ability = described_class.new(employee)
      expect(ability).to be_able_to(:update, Category)
    end

    it 'cannot create categories' do      
      ability = described_class.new(employee)
      expect(ability).not_to be_able_to(:create, Category)
    end
  end
end
