Rails.application.routes.draw do
  root 'static_pages#home'
  get 'users/show'
  get 'users', to: 'users#index'

  devise_for :users,
    controllers: {
      omniauth_callbacks: 'omniauth_callbacks',
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      passwords: 'users/passwords'
    }
  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new'
    get 'new_user_registraion', to: 'users/registrations#new'
    delete "sign_out", to: 'users/sessions#destroy'
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :users
  resources :microposts, only: [:new, :create, :destroy]

end
