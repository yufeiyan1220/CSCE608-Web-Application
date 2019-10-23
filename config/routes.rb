Rails.application.routes.draw do
  resources :apps do
    resources :app_release_platforms, only: [:index, :new, :create, :destroy]
  end

  root 'static_pages#home'
  get 'static_pages/home', to: 'static_pages#index'
  
  resources :companies
  resources :platforms
  resources :apps
  
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
