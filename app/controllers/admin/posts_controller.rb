class Admin::PostsController < InheritedResources::Base
  def create
    create!{post_url(@post)}
  end
  def update 
    update!{post_url(@post)}
  end
end
