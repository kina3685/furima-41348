Rails.application.routes.draw do
  devise_for :user
  root to: "items#index"
  get 'items/index'
    resources :users,only: [:show,:edit, :update]
   


end

