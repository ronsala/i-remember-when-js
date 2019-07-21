Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, shallow: true do
    resources :events, only: [:index]
    resources :recollections, only: [:index]
  end

  resources :events, shallow: true do
    resources :users, only: [:index]
    resources :recollections, only: [:index, :new, :create]
  end

  resources :recollections, except: [:new, :create]
end
