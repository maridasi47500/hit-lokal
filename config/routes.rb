Rails.application.routes.draw do
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
