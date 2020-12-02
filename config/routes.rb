Rails.application.routes.draw do
  get 'messages/create'
  get 'messages/destroy'
  get 'comments_chef/create'
  get 'comments_chef/destroy'
  get 'comments_chefs/create'
  get 'comments_chefs/destroy'
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

  resources :users, only: %i[show index] do
    member do
      get :following, :followers
    end
    collection do
      get :search
    end
  end

  resources :microposts,      only: %i[index show new create destroy] do
    resources :comments,      only: %i[create destroy]
    collection do
      get :search
    end
  end

  resources :relationships,   only: %i[create destroy]
  resources :likes,           only: %i[create destroy]
  resources :bookmarks,       only: %i[index create destroy]
  resources :marks,           only: %i[create destroy]
  resources :maps,            only: :index
  resources :chefs,           only: %i[create destroy show new index] do
    resources :messages, only: %i[create destroy]
  end
end
