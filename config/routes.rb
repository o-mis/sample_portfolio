Rails.application.routes.draw do
  get 'bookmarks/create'
  get 'bookmarks/destroy'
  get 'likes/index'
  get 'likes/create'
  get 'likes/destroy'
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

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships,   only: [:create, :destroy]
  resources :microposts,      only: [:index, :show, :new, :create, :destroy]
  resources :likes,           only: [:create, :destroy]
  resources :bookmarks,       only: [:create, :destroy]
end
