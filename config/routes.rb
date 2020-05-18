Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end
end
