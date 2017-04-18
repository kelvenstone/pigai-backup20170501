Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :compositions do
      resources :writings
  end

  resources :writings do
      resources :corrections
  end

  namespace :account do
    resources :compositions
    resources :writings
    resources :corrections

  end

  namespace :admin do
   resources :compositions
   resources :writings
   resources :corrections
  end


  resources :images, only: [:create, :destroy]
  root 'compositions#index'
end
