# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # FRONTEND
  root to: 'home#index'
  get '/login_page', to: 'login_page#index'

  # AUTH
  post :login, to: 'create_session#call'

  # USERS
  post :employee, to: 'create_employee#call'
  put 'employee/:id', to: 'update_employee#call'
  delete 'employee/:id', to: 'delete_employee#call'

  # CARDS
  post :card, to: 'create_card#call'

  # CATEGORIES
  post :category, to: 'create_category#call'
end
