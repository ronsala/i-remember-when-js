# frozen_string_literal: true

Rails.application.routes.draw do

  root to: 'welcome#home'

  # devise_for :users

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }

  get '/users', to: 'users#index'

  resources :users, shallow: true do
    resources :events, only: [:index]
    resources :memories, only: [:index]
  end

  resources :events, shallow: true do
    resources :users, only: [:index]
    resources :memories, only: %i[index new create]
  end

  resources :memories, except: %i[new create]
end
