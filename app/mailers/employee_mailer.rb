# frozen_string_literal: true

class EmployeeMailer < ApplicationMailer
  def welcome_email(user, password)
    @user = user
    @password = password

    mail to: @user.email, subject: 'Bem vindo ao nosso app!'
  end
end
