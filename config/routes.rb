Rails.application.routes.draw do
  devise_for :users
  root "welcome#index"
  # get 'yelps/search'

  get '/users/:id/yelps/', to: 'yelps#index', as: "user_yelps"
  get '/search', to: 'yelps#search'
  get '/search/yelp', to: 'yelps#index'
  resources 'yelps'
  resources 'profiles'
  # resources 'users'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
