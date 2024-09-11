# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Card do
  it { is_expected.to validate_presence_of(:last_digits) }
end
