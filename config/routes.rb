Rails.application.routes.draw do
  resources :comments
  resources :user_study_groups, only: [:destroy]
  resources :study_groups
  resources :user_body_parts, only: [:destroy, :create, :update]
  resources :card_stacks 
  resources :body_parts, only: [:index]
  
  resources :users, only: [:create, :index, :destroy]
    post 'login', to: "auth#create"
    post '/signup', to: 'users#create'
    get 'persist', to: "auth#show"
end
