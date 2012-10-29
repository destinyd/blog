class PostsController < InheritedResources::Base
  defaults finder: :find_by_permalink!
  custom_actions collection: [:archives,:tag]

  def tag
    @posts = Post.tagged_with(params[:id])
    render :index
  end

  #def archives
    #@archives = Post.archives
    #archives!
  #end
end
