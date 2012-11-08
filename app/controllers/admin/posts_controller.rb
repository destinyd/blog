class Admin::PostsController < InheritedResources::Base
  before_filter :admin?
  def create
    create!{post_url(@post)}
  end
  def update 
    update!{post_url(@post)}
  end

  def collection
    @posts ||= end_of_association_chain.recent.paginate(page: params[:page])
  end
end
