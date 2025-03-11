Rails.application.routes.draw do

  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  get "/", to: redirect('/fr', status:301)
  # Defines the root path route ("/")
  # root "posts#index"

  scope "/backoff" do
    #get "/", to: "admin#home"
    resources :admins, only: [:index], path:"/"
    resources :actifs, only: [:new,:create,:edit,:update,:destroy], as: :actif_backoff
    get "actifs", to: "admins#actifs", as: :actifs_backoff
    resources :articles, only: [:new,:create,:edit,:update,:destroy]
    resources :prestations, only: [:new, :create,:edit,:update,:destroy]
    resources :faqs, except:[:index],path: :faq
  end

  scope "/:locale" do
    root "pages#home"
    get "about", to: "pages#about"
    resources :actifs, only:[:index,:show]
    resources :authors,path:"/experts"
    get "blog", to: "articles#index"
    get "blog/:id", to: "articles#show", as: :post
    get "blog/:slug_authors/:id", to: "articles#show", as: :post_author
    get "blog/:category", to: "articles#category", as: :blog_category
    post "blog/category_filter", to: "articles#category_filter", as: :blog_filter
    get "prestation/:id",to: "prestations#show", as: :prestation_show

     post "send", to: "pages#send_contact"

    #get "/actifs", controller: "actifs", action: "index"
    #get "/actifs/:id", controller: "actifs", action: "show"
    localized do
      get "laboratoire-plantes", to: "pages#laboratoire_plantes"
      get "analyse-recherche-developpement",to: "pages#analyses"
      get "laboratoire-cosmetologie",to: "pages#cosmetologie"
      get "actifs",to: "actifs#index",as: :actifs
      get "faqs",to: "faqs#index",as: :faqs
      get "authors",to: "authors#index",as: :authors
      get "contact",to: "pages#contact"
      #resources :actifs, only:[:index,:show]
    end
  end




end
