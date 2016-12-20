Rails.application.routes.draw do
  root 'bands#index'

  resources :users, only: [:index, :new, :create] do
    post "make_admin", on: :member
    post "revoke_admin", on: :member
  end

  resource :session, only: [:new, :create, :destroy]

  resources :bands do
    resources :albums, only: [:new]
  end

  resources :albums, only: [:create, :destroy, :edit, :update, :show] do
    resources :tracks, only: [:new]
  end

  resources :tracks, except: [:index, :new]

  resources :notes, only: [:create, :update, :destroy, :edit]

  resources :taggings, only: [:create, :destroy]
end
