# frozen_string_literal: true

require 'rails_helper'
require 'cancan/matchers'

RSpec.describe AdminAbility, type: :model do
  let(:admin) { FactoryBot.create(:user, role: :admin) }

  describe 'Admin abilities' do
    it 'can manage all' do
      ability = described_class.new(admin)
      expect(ability).to be_able_to(:manage, :all)
    end
  end
end
