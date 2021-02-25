Rails.application.routes.draw do
  resources :user_study_groups, only: [:destroy]
  resources :study_groups
  resources :user_body_parts, only: [:destroy]
  resources :card_stacks 
  resources :body_parts, only: [:index]
  
  resources :users, only: [:create, :index]
    post 'login', to: "auth#create"
    post '/signup', to: 'users#create'
    get 'persist', to: "auth#show"
end
