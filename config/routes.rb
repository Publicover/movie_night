Rails.application.routes.draw do

  devise_for :users
  # get 'dashboards/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :movies
  root 'dashboards#index'
end
