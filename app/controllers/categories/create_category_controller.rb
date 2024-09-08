class CreateCategoryController < ApplicationController
  skip_before_action :verify_authenticity_token

  def call        
    begin
      category_creator = CategoryCreator.new(name: params[:name])
      category = category_creator.call
        
      render json: { category: category }, status: :created    
    rescue => error
      render json: { error: error }, status: :unauthorized    
    end
    
  end
end