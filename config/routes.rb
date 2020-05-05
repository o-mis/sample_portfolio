Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth_callbacks',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_out', to: "controller#method" 'sign_out', to: 'users/sessions#destroy'
  end

  root 'static_pages#home'
  get '/home', to:'static_pages#home'
  #get '/contact', to:'static_pages#contact'
  #get '/signup', to:'users#new'
  resources :microposts
  resources :users
end
