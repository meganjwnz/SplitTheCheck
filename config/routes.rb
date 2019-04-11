Rails.application.routes.draw do
  devise_for :users
  resources :restaurants, except: [:destroy] do
    resources :votes, only: [:create]
  end
  resources :votes
  post 'restaurants/upvote', to: 'restaurants#upvote'
  post 'restaurants/downvote', to: 'restaurants#downvote'
  root to: 'restaurants#index'
  
end
