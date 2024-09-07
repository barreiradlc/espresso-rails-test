# frozen_string_literal: true

class CategoryCreator
  def initialize(category_params)
    @category_params = category_params
  end

  def call
    Category.create!(@category_params)
  end
end
