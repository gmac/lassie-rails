Lassie::Application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :projects do
    resources :actors
    resources :scenes
    resources :inventory_lists
    resources :inventory_items
    resources :inventory_combos
  end

  root 'projects#index'

  get '/login' => 'sessions#new'
  delete '/logout' => 'sessions#destroy'
end
