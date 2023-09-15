Rails.application.routes.draw do
  get 'artists/show'
  get "/artiste.php", to: "artists#show"
  get "/videos.php", to: "clips#showclip"
  scope(:path_names => { :new => "nouveau", :edit => "editer" }) do
  resources :news, :path => "actualites"
end
    get "recover.php", to: "ajouter#user"
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  resources :news
  resources :posts
  resources :clips
  get 'ajouter/clip'
  get "ajouter.php", to: 'ajouter#clip'
  post "ajouter.php", to: 'clips#create'
  get 'welcome/index'
  get "index.php", to: 'welcome#index'
  root 'welcome#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
