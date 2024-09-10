# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserEmployeeDestroyer, type: :service do
  let!(:user) { create(:user) }

  context 'when delete a employee' do
    it 'cannot be found anymore' do
      assert_exception_raised(ActiveRecord::RecordNotFound) do
        service = described_class.new(user.id)
        service.call

        User.find(user.id)
      end
    end
  end
end
