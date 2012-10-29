class PostsController < InheritedResources::Base
  custom_actions :collection => :archives

  #def archives
    #@archives = Post.archives
    #archives!
  #end
end
