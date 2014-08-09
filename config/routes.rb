Lassie::Application.routes.draw do

  # Root:
  root 'projects#index'

  # Login / Logout:
  get '/login' => 'sessions#new', as: 'signin'
  delete '/logout' => 'sessions#destroy', as: 'signout'

  # Sessions / Users / Behaviors
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

  # JSON API methods
  resources :behaviors, except: [:new, :edit]
  resources :scene_layers, except: [:new, :edit]
  resources :scene_grids, except: [:new, :edit]
  resources :scene_matrices, except: [:new, :edit]

end
