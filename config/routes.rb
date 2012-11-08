Blog::Application.routes.draw do


  constraints :subdomain => "admin",as: :admin do
    get "login" => 'login#index'
    #namespace :admin do
      resources :posts, :module => "admin"
      resources :sessions, :module => "admin"
    #end
    root :to => "admin/posts#index"
  end

  constraints :subdomain => '' do
    #resources :posts
    get "about" => 'home#about',as: :about
    get "blog/archives" => "posts#archives",as: :blog_archives
    match "/blog/:year/:month/:day/:id" => 'posts#show',as: :blog
    match "/blog/categories/:id" => 'posts#tag',as: :category
    match "/blog/page/:page" => 'posts#index', constraints: {
      page: /[23456789]|\d{2,}/
    }
    root :to => "posts#index",as: :home,page: 1
  end
end
