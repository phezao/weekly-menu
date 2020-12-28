Rails.application.routes.draw do
  resources :examples
  resources :menus do
    post :generate
    resources :supermarket_ingredients, only: [:index]
  end
  resources :recipes do
    resources :ingredients, except: [:index, :show]
    member do
      get :new_to_menu
      post :add_to_menu
    end
  end
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
