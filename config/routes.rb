Rails.application.routes.draw do
  resources :comments
  devise_for :users
  resources :restaurants, except: [:destroy] do
    resources :votes, only: [:create]
  end
  resources :votes
  post 'votes/upvote_restaurant', to: 'votes#upvote_restaurant'
  post 'votes/downvote_restaurant', to: 'votes#downvote_restaurant'
  root to: 'restaurants#index'

  resources :favorites
  post 'favorites/favorite_restaurant', to: 'favorites#favorite_restaurant'
  root to: 'restaurants#index'
end
