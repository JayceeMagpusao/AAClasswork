Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users

  resources :users, except: [:new, :edit]
  resource :artwork_shares, only: [:create, :destroy]
end
