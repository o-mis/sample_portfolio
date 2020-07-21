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

  resources :users,           only: %i[show index] do
    member do
      get :following, :followers
    end
    collection do
      get :search
    end
  end

  resources :microposts,      only: %i[show new create destroy] do
    resources :comments,        only: %i[create destroy]

    collection do
      get :search
    end
  end

  resources :relationships,   only: %i[create destroy]
  resources :likes,           only: %i[create destroy]
  resources :bookmarks,       only: %i[index create destroy]
  resources :maps,            only: :index
end
