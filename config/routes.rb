Rails.application.routes.draw do
  devise_for :users
  #devise_for :users
  
  #get "/articles(/:id)", to: "articles#show"                                               //nonresourceful routing
  #get 'articles/:id/with_user/:user_id', to: 'articles#show'                               //static segment
  #get 'articles/:id/:user_id', to: 'articles#show'                                         //dynamic segment

  #get "/articles/:id", to: "articles#show" , contraints: {id: /[A-Z]\d{5}/}                //constraints
  #get 'articles/*other', to: 'articles#unknown'
  #get '/articles(/:id)', to: "articles#show"                                               // Bound parameters
  #get '/articles/:id', to:  "articles#show", defaults: { id: 1 }                           //defining defaults
  #resources :articles, param: :identifier                                                   //renaming the resource identifier like :id to :identifier
  root to: 'pages#index'
  get '/secret', to: 'pages#secret', as: :secret
  get '/stories', to: redirect('/articles')                                                 #redirect one path to another path
  concern :commentable do                                                                   #concerns
    #get 'preview', on: :new
    resources :comments, as: "comments"
  end
  
  #resources :articles, concerns: :commentable, path_names: { new: 'make', edit: 'change' } do   #To override the new and edit segments
    #get 'preview', on: :member
    #resolve("Article") { [:article] }                                                    //singular URL /article instead of /articles
  #end
  #direct :homepage do                                                                      //custom URL Helpers
  # "https://rubyonrails.org"
  #end
  resources :articles do
    resources :comments
  end
  #resources :articles, concerns: :commentable,  path_names: { new: 'make', edit: 'change' } override the path segments
  #scope(path_names: { new: 'neu', edit: 'bearbeiten' }) do                                  #edit path names
   # resources :articles, path: 'aartical', concerns: :commentable
  #end

  #scope "/admin" do                                                                           // scope module to group multiple resources without prefix in path name
    #resources :articles, concerns: :commentable
  #end
  #namespace :admin do                                                                        //Namespace to group resources 
   # resources :articles, concerns: :commentable
  #end


  #resources :articles, concerns: :commentable
    
  #resources :articles, only: [:index,:new, :show, :edit] do
   # resources :comments
  

=begin
  get "/articles", to: "articles#index"
  get "/articles/new", to: "articles#new", as: :new_article
  get "/articles/:id", to: "articles#show", as: :article
  get "/articles/:id/edit", to: "articles#edit", as: :edit_article
  post "/articles/", to: "articles#create", as: :articles
  patch "/articles/:id", to: "articles#update"
  delete "/articles/:id", to: "articles#destroy"
=end
  #resources :articles

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #delete "/articles/:id", to: "articles#destroy"
  # Defines the root path route ("/")
  #
end
