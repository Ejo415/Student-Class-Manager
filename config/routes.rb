Rails.application.routes.draw do
  get '/auth/google_oauth2/callback', to: 'sessions#google'
  root to: 'sessions#welcome'
  resources :klasses do
    resources :user_klasses
  end
  resources :users, only: [:new, :create, :show]
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  delete '/session', to: 'sessions#destroy'
  get '/user/:user_id/user_klasses', to: 'user_klasses#index', as: 'user_user_klasses' 
  get '/user/:user_id/user_klasses/:id', to: 'user_klasses#show', as: 'user_user_klass'
  delete'/user/:user_id/user_klasses/:id', to: 'user_klasses#destroy'
  #get '/register', to: 'user_klasses#new'
  #post '/register', to: 'user_klasses#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
