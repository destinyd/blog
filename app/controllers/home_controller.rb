class HomeController < ApplicationController
  def index
    @posts = Post.scoped
  end
end
