Rails.application.routes.draw do
  
  root 'homes#index'
  
  devise_for :users
  
  resources :books
  resources :users, only:[:index, :show, :edit, :update] 
  get "/home/about" => "homes#about"
  
end
