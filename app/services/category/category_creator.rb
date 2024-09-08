# frozen_string_literal: true

class CategoryCreator < ApplicationService
  def initialize(category_params)
    @category_params = category_params
    super(:create, Category)
  end

  def call
    Category.create!(@category_params)
  end
end
