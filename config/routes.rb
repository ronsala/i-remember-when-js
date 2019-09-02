# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users
  get '/', to: 'welcome#home'
  root to: 'welcome#home'

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
