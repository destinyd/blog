class Post < ActiveRecord::Base
  attr_accessible :body, :title, :tag_list
  #acts_as_commentable
  acts_as_taggable
  scope :archives,select([:title,:created_at])
end
