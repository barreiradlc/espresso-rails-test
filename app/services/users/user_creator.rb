# frozen_string_literal: true

class UserCreator
  def initialize(user_params)
    @user_params = user_params
  end

  def call
    User.create!(@user_params)
  end
end
