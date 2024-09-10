# frozen_string_literal: true

class UserEmployeeUpdater
  def initialize(user_id, user_params)
    @user_id = user_id
    @user_params = user_params
  end

  def call
    user = User.find(@user_id)
    user.update!(@user_params)

    user
  end
end
