# frozen_string_literal: true

class UserEmployeeDestroyer
  def initialize(user_id)
    @user_id = user_id
  end

  def call
    user = User.find(@user_id)
    user.destroy!
  end
end
