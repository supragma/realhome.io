Rails.application.routes.draw do
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get "property_agent", to: "users/property_agents#new", as: "new_property_agent"
    post "property_agent", to: "users/property_agents#create", as: "property_agents"
  end
  devise_for :users, controllers: { registrations: "users/registrations"} 
  resources :properties
end
