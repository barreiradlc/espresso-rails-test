# frozen_string_literal: true

class UserEmployeeCreator
  def initialize(user_params)
    @user_params = user_params
  end

  def call
    user = User.new(@user_params)
    user.role = :employee
    user.save!

    user
  end
end
