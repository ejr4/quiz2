Rails.application.routes.draw do
  get('/', {to: 'ideas#index', as: 'root'})
  resources :ideas do
    resources :reviews, only: [:create, :destroy]
  end
  
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
end
