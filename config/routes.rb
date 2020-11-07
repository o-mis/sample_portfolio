Rails.application.routes.draw do
  get 'home/index'
  root 'static_pages#home'

  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new'
    get 'new_user_registraion', to: 'users/registrations#new'
    delete 'sign_out', to: 'users/sessions#destroy'
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :users, only: [:show, :index] do
    member do
      get :following, :followers
    end
    collection do
      get :search
    end
  end

  resources :microposts,      only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :comments,      only: [:create, :destroy]
    collection do
      get :search
    end
  end

  resources :relationships,   only: [:create, :destroy]
  resources :likes,           only: [:create, :destroy]
  resources :bookmarks,       only: [:index, :create, :destroy]
  resources :marks,           only: [:create, :destroy]
  resources :maps,            only: :index
  resources :chefs,           only: [:create, :destroy, :show, :new, :index]
end
