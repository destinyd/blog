class Post < ActiveRecord::Base
  #chinese_permalink :title#, :permalink_field => :url
  attr_accessible :body, :title, :tag_list
  #acts_as_commentable
  acts_as_taggable
  scope :recent,order('id desc')
  scope :archives,recent.select([:title,:created_at,:permalink])
  validates :title,:permalink, presence: true, uniqueness: true
  validates :body, presence: true
  default_scope includes(:tags)

  def to_s
    title
  end

  def next
    @next ||= Post.order(:id).where('id > ?',self.id).first || false
  end

  def prev
    @prev ||= Post.order('id desc').where('id < ?',self.id).first || false
  end

  def to_permalink
    "/blog/#{created_at.year}/#{created_at.month}/#{created_at.day}/#{permalink}"
  end
  
  before_validation do
    self.permalink = PinYin.permlink(title) if title_changed?
  end
end
