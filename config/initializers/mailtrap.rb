# frozen_string_literal: true

ActionMailer::Base.smtp_settings = {
  user_name: ENV.fetch('MAILTRAP_USER', nil),
  password: ENV.fetch('MAILTRAP_PASSWORD', nil),
  address: 'sandbox.smtp.mailtrap.io',
  host: 'sandbox.smtp.mailtrap.io',
  port: '2525',
  authentication: :login
}
