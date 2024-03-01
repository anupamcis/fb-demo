Rails.application.routes.draw do
  resources :restaurants
  get 'message/indexm'
  get '/like/indexlike/:id',to: "like#index_like"
  get "/like/liked_by/:id",to: "like#liked_by"
  
  namespace :admin do
    get 'users/index'
    get 'home/indexadmin'
    resources :home
    resources :users
  end
  get "/user/like/indexlike/:id",to: "like#index_like"
  get "/admin/home/indexadmin" ,to: "home#indexadmin"
  get "/admin/users/index", to: "users#index"
  get "/admin/friend/index", to: "friend#index"
   
  get "/message/create/:id",to: "message#create"
  get "/message/destroy/:id",to: "message#destroy"
  get "message/indexm", to:"message#indexm"
  get "message/friend_message/:id",to: "message#friend_message" ,as: "friend_message"
  post "message/create_message"


  get 'reply/indexr'
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  root "post#index"
  
  get 'profile/index'
  get "profile/user_profile/:id", to:"profile#user_profile"
  get "/friendlist/profile/user_profile/:id", to:"profile#user_profile"
  get "/indexp", to:"profile#indexp"
  
  get "/index", to:"post#index"
  resources :post
  
  get '/indexf' , to:"friendlist#indexf"
  get "/create/:id", to: "friendlist#create"
  get "friendlist/friend", to: "friendlist#friend"
  get 'friendlist/indexf'
  get "user/friend",to: "profile#user_post"
  get "/friendlist/friendrequest",to: "friendlist#friend_request" 
  get "/friendlist/update/:id",to:"friendlist#update"
  delete "/friendlist/destroy/:id",to:"friendlist#destroy"

  get "/replies" ,to: "reply#indexr"
  get 'comment/index/:id', to: 'comment#index',as: "comment_index"
  get 'comment/index/:id', to: 'comment#index'
  get "reply/new/:id", to:"reply#new"
  get "/replies/:id",to: "reply#indexr"
  resources :comment
  resources :reply
  resources :friendlist
  resources :message
end
