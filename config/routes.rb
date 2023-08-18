Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :bicycles

  root 'statpages#home'
  get 'test' => 'statpages#test'
end
