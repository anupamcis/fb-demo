Rails.application.routes.draw do
  get 'like/indexlike'
  get 'like/indexlike/:id',to: "like#indexlike"
  namespace :admin do
    get 'friend/index'
    get 'users/index'
    get 'home/indexadmin'
    resources :home
    resources :users
    # get "/admin/home/destroy/:id", to:"home#destroy"
    
  end
  get "/admin/home/indexadmin" ,to: "home#indexadmin"
  get "/admin/users/index", to: "users#index"
  get "/admin/friend/index", to: "friend#index"

  get 'reply/indexr'
  devise_for :users
  root "post#index"
  
  get 'profile/index'
  get "profile/userprofile/:id", to:"profile#userprofile"
  get "/friendlist/profile/userprofile/:id", to:"profile#userprofile"
  get "/indexp", to:"profile#indexp"
  
  get "/index", to:"post#index"
  resources :post
  
  get '/indexf' , to:"friendlist#indexf"
  get "/create/:id", to: "friendlist#create"
  get "friendlist/friend", to: "friendlist#friend"
  get 'friendlist/indexf'
  get "user/friend",to: "profile#userpost"
 
  get "/replies" ,to: "reply#indexr"
  get 'comment/index/:id', to: 'comment#index',as: "comment_index"
  get 'comment/index/:id', to: 'comment#index'
  get "reply/new/:id", to:"reply#new"
  get "/replies/:id",to: "reply#indexr"
  resources :comment
  resources :reply
end
