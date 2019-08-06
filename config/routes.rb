Rails.application.routes.draw do
  resources :retweets
  ###################
  resources :likes
  resources :tweets
  resources :follows
  resources :users
  ###################
  get '/auth', to: 'auth#persist'
  get '/userTweets', to: 'tweets#user_tweets'
  get '/timeline', to: 'tweets#timeline'
  get 'users/:id/showTweets', to: 'tweets#show_user_tweets'
  ###################
  post '/login', to: 'auth#create'
  post '/follow/:id', to: 'follows#follow'
  post '/unfollow/:id', to: 'follows#unfollow'

end
