Rails.application.routes.draw do
  root 'static_pages#home'
  post "/" => "microposts#create"

  devise_for :users,
    controllers: {
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

  resources :users,            only: [:show, :index] do
    member do
      get :following, :followers
    end
    collection do
      get :search
    end
  end

  resources :microposts,      only: [:show, :new, :create, :destroy] do
    collection do
      get :search
    end
  end

  resources :relationships,   only: [:create, :destroy]
  resources :likes,           only: [:create, :destroy]
  resources :bookmarks,       only: [:index, :create, :destroy]
end
