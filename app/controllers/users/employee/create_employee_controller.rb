# frozen_string_literal: true

class CreateEmployeeController < ApplicationController
  skip_before_action :verify_authenticity_token

  def call
    @employee_payload = employee_params
    @employee_payload[:password] = generate_password

    user_employee_creator = UserEmployeeCreator.new(@employee_payload)
    employee = user_employee_creator.call

    user_employee_welcome_mail_sender = UserEmployeeWelcomeMailSender.new(EmployeeMailer)
    user_employee_welcome_mail_sender.call(
      employee,
      @employee_payload[:password]
    )

    render json: { employee: employee }, status: :created
  end

  private

  def generate_password
    email = employee_params[:email]

    random_hex = rand(9.pow(6)).to_s(16)
    mail, = email.split('@')

    "#{random_hex}#{mail}"
  end

  def employee_params
    params.require(:user).permit(:name, :email, :company_id)
  end
end
