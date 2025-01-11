Rails.application.routes.draw do
 
  root to: "items#index"
  get 'items/index'
  get 'donations/index'
end

