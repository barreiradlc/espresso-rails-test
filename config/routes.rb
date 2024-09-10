# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  # AUTH
  post :login, to: 'create_session#call'

  # USERS
  post :employee, to: 'create_employee#call'

  # CATEGORIES
  post :category, to: 'create_category#call'
end
