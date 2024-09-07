require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  # it { should define_enum_for(:role).with_values([:admin, :employee]) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should have_secure_password }
end