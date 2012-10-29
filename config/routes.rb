Blog::Application.routes.draw do
  constraints :subdomain => "admin",as: :admin do
    #namespace :admin do
      resources :posts, :module => "admin"
    #end
    root :to => "admin/posts#index"
  end

  constraints :subdomain => '' do
    #resources :posts
    get "blog/archives" => "posts#archives",as: :blog_archives
    match "/blog/:year/:month/:day/:id" => 'posts#show'
    match "/blog/categories/:id" => 'posts#tag'
    root :to => "home#index",as: :home
  end
end
