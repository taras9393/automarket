Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:index, :show, :destroy]
  resources :bicycles do
    member do
      put 'vote'
    end
  end

  resources :categories

  root 'statpages#home'
  get 'test' => 'statpages#test'
  get 'contacts' => 'statpages#contacts'
  get 'history' => 'statpages#history'
  get 'price' => 'statpages#price'
end
