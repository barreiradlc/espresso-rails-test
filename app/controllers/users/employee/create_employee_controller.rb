# frozen_string_literal: true

class CreateEmployeeController < ApplicationController
  skip_before_action :verify_authenticity_token

  def call
    user_employee_creator = UserEmployeeCreator.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      company_id: params[:company_id]
    )

    employee = user_employee_creator.call

    render json: { employee: employee }, status: :created
  end
end
