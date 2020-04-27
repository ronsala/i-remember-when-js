# frozen_string_literal: true

Rails.application.routes.draw do
  # root to: 'welcome#home'
  # get '/about', to: 'pages#about'
  # get '/privacy', to: 'pages#privacy'

  # devise_for :users, controllers: {
  #   omniauth_callbacks: 'users/omniauth_callbacks',
  #   registrations: 'users/registrations',
  #   sessions: 'users/sessions'
  # }

  # resources :events do
  #   resources :memories, only: %i[new create]
  # end

  # resources :users, only: %i[index show edit update], shallow: true do
  #   resources :memories, only: %i[index]
  # end

  # resources :memories, only: %i[show edit update destroy]

  # devise_scope :user do
  #   delete 'sign_out', to: 'devise/sessions#destroy'
  # end
  namespace :api do
    namespace :v1 do
      resources :events
    end
  end
end
