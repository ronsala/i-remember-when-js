# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'welcome#home'
  get '/pages/:page', to: 'pages#show'

  devise_for :users, path: 'account', controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :users, only: %i[index show], shallow: true do
    resources :events
    resources :memories
  end

  resources :events, only: [:index] do
    resources :users, only: [:index]
    resources :memories, only: %i[index new create]
  end

  resources :memories, only: [:index]

  devise_scope :user do
    delete 'sign_out', to: 'devise/sessions#destroy' # TODO, as: :destroy_user_session
  end
end
