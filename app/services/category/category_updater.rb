# frozen_string_literal: true

class CategoryUpdater
  def initialize(category_id, category_params)
    @category_id = category_id
    @category_params = category_params
  end

  def call
    @category = Category.find(@category_id)
    @category.update!(@category_params)
    @category
  end
end
