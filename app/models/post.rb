class Post < ActiveRecord::Base
  chinese_permalink :title#, :permalink_field => :url
  attr_accessible :body, :title, :tag_list
  #acts_as_commentable
  acts_as_taggable
  scope :archives,select([:title,:created_at])
  def to_permalink
    "/blog/#{created_at.year}/#{created_at.month}/#{created_at.day}/#{permalink}"
  end
end
