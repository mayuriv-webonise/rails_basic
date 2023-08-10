Rails.application.routes.draw do
  root to: 'posts#index'
  resources :posts do
    member do
      patch :publish
      patch :unpublish
    end
  end
end