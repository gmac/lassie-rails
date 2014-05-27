Lassie::Application.routes.draw do

  # Root:
  root 'projects#index'

  # Login / Logout:
  get '/login' => 'sessions#new'
  delete '/logout' => 'sessions#destroy'

  # Sessions / Users / Behaviors
  resources :behaviors, except: [:new, :edit]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  
  # Project resources:
  resources :projects do
    resources :actors
    resources :assets
    resources :behavior_types
    resources :inventory_combos
    resources :inventory_items
    resources :inventory_lists
    resources :scenes

    # Landing pages:
    get '/setup' => 'projects#setup'
    get '/inventory' => 'projects#inventory'
  end
end
