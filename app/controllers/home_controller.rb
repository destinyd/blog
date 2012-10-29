class HomeController < ApplicationController
  def index
    @posts = Post.recent.paginate(page: params[:page])
  end
end
