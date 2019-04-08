Rails.application.routes.draw do
  devise_for :users
  resources :restaurants, except: [:destroy]
  post 'restaurants/upvote', to: 'restaurants#upvote'
  post 'restaurants/downvote', to: 'restaurants#downvote'
  root to: 'restaurants#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
