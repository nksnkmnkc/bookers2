Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  get "homes/about" => "homes#about", as: "about"

  resources :books, only:[:new, :index, :show, :edit , :destroy, :update]
  resources :users, only:[:show, :edit, :index ,:update, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
