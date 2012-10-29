class Post < ActiveRecord::Base
  chinese_permalink :title#, :permalink_field => :url
  attr_accessible :body, :title, :tag_list
  #acts_as_commentable
  acts_as_taggable
  scope :recent,order('id desc')
  scope :archives,recent.select([:title,:created_at,:permalink])

  def to_permalink
    "/blog/#{created_at.year}/#{created_at.month}/#{created_at.day}/#{permalink}"
  end
end
