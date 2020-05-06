Rails.application.routes.draw do
  root 'static_pages#home'
  get '/home', to:'static_pages#home'
  get 'user', to: 'users#show'

  devise_for :users,
    controllers: {
      omniauth_callbacks: 'omniauth_callbacks',
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
  devise_scope :user do
    # get 'sign_in', to: 'users/sessions#new'
    # delete "sign_out", to: 'users/sessions#destroy'
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :users
  resources :microposts
end
