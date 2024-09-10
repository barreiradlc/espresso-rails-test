# frozen_string_literal: true

class UserEmployeeWelcomeMailSender
  def initialize(mailer)
    @mailer = mailer
  end

  def call(user, password)
    @mailer.welcome_email(user, password).deliver_now
  rescue StandardError => e
    Rails.logger.debug e
  end
end
