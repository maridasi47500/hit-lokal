Rails.application.routes.draw do
  resources :checkmusicalprods do
    collection do
      post 'verify'
    end
  end
  resources :checkartists do
    collection do
      post 'verify'
    end
  end
  get 'asso/index'
  get "lassociation.php", to: 'asso#index'
  get "compositeurs.php", to: 'compositeurs#index', as: :tous_composers
  get "compositeur.php", to: 'compositeurs#show'
  get "moncompositeur.php", to: 'compositeurs#moncompositeur'
  post "moncompositeur.php", to: 'compositeurs#ajoutermoncompositeur'
  get "realisateurs.php", to: 'realisateurs#index'
  get "realisateur.php", to: 'realisateurs#show'
  resources :comments
  get "top.php", to:'tops#index'
  get 'artists/show'
  get "/artiste.php", to: "artists#show"
  get "/recherche.php", to: "artists#recherche"
  get "/artistes.php", to: "artists#index"
  post "fetch-artistes-style.php", to: "artists#artiststyle"
  post "fetch-artistes-letters.php", to: "artists#artistletters"
  get "/top/nouveautes", to: "tops#nouveautes"
  get "/videos.php", to: "clips#showclip"
  get "/lien.php", to: "clips#lien"
  get "/autrelien.php", to: "clips#autrelien"
  get "/autrelien1.php", to: "clips#autrelien1"
  get "/checkartist.php", to: "clips#checkartist"
  get "/checkmuzicalprod.php", to: "clips#checkmuzikalprod"
  get "/my_trending_videos.php", to: "clips#my_trending_videos"

  get "/top/videos/:title.html", to: "clips#showclip", as: :linktovideo
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
