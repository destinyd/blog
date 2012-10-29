class PostsController < InheritedResources::Base
  defaults finder: :find_by_permalink!

  def tag
    @posts = Post.tagged_with(params[:id])
    render :index
  end
  
  def archives
    @posts = Post.archives
  end

  protected
  def collection
    @posts ||= end_of_association_chain.recent.paginate(page: params[:page])
  end

  #def archives
    #@archives = Post.archives
    #archives!
  #end
end
