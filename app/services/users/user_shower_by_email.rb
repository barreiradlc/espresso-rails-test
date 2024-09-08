# frozen_string_literal: true

class UserShowerByEmail
  def initialize(user_email)
    @user_email = user_email
  end

  def call
    User.find_by(email: @user_email)
  end
end
