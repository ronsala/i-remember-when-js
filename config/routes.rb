# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'welcome#home'
  # get '/pages/:page', to: 'pages#show', as: '/:page'
  get '/about', to: 'pages#about'
  get '/privacy', to: 'pages#privacy'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :events do
    resources :users, only: [:index]
    resources :memories, only: %i[index new create]
  end
  
  resources :users, only: %i[index show], shallow: true do
    resources :events, only: [:show]
    resources :memories
  end

  resources :memories, only: [:index]

  devise_scope :user do
    delete 'sign_out', to: 'devise/sessions#destroy'
  end
end
