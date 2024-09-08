# frozen_string_literal: true

class CreateCategoryController < ApplicationController
  skip_before_action :verify_authenticity_token

  def call
    category_creator = CategoryCreator.new(name: params[:name])
    category = category_creator.call

    render json: { category: category }, status: :created
  rescue StandardError => e
    render json: { error: e }, status: :unauthorized
  end
end
