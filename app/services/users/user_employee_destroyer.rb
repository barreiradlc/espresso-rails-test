# frozen_string_literal: true

class UserEmployeeDestroyer
  def initialize(user_id)
    @user_id = user_id
  end

  def call
    User.destroy(id: @user_id)
  end
end
