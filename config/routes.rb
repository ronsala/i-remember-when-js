# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/index'
  get 'users/new'
  get 'users/create'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  get 'memories/index'
  get 'memories/new'
  get 'memories/create'
  get 'memories/show'
  get 'memories/edit'
  get 'memories/update'
  get 'memories/destroy'
  get 'events/index'
  get 'events/new'
  get 'events/create'
  get 'events/show'
  get 'events/edit'
  get 'events/update'
  get 'events/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

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
