# frozen_string_literal: true

class UpdateEmployeeController < ApplicationController
  skip_before_action :verify_authenticity_token

  def call
    user_employee_updater = UserEmployeeUpdater.new(employee_params[:id], employee_params)
    updated_employee = user_employee_updater.call

    render json: { employee: updated_employee }, status: :ok
  end

  private

  def employee_params
    params.require(:user).permit(:id, :name, :email)
  end
end
