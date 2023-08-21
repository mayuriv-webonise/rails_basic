Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts do
    member do
      patch :publish
      patch :unpublish
    end
  end
end