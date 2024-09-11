# frozen_string_literal: true

class DeleteEmployeeController < ApplicationController
  skip_before_action :verify_authenticity_token

  def call
    user_employee_destroyer = UserEmployeeDestroyer.new(employee_params[:id])
    user_employee_destroyer.call

    head :no_content
  end

  private

  def employee_params
    params.permit(:id)
  end
end
