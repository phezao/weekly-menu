Rails.application.routes.draw do
  resources :examples
  resources :menus
  resources :recipes do
    resources :ingredients, except: [:index, :show]
  end
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
