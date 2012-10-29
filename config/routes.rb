Blog::Application.routes.draw do
  constraints :subdomain => "" do
    #resources :posts
    get "blog/archives" => "posts#archives",as: :blog_archives
    match "/blog/:year/:month/:day/:id" => 'posts#show'
    match "/blog/categories/:id" => 'posts#tag'
    root :to => "home#index"
  end

  constraints :subdomain => "admin" do
    #namespace :admin do
      resources :posts, :module => "admin"
    #end
    root :to => "admin/posts#index"
  end
end
