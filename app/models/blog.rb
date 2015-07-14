class Blog < ActiveRecord::Base
  def self.title
    b = Blog.find('1')
    b.title
  end
  def self.upload_time
    b = Blog.find('1')
    b.created_at.in_time_zone("Pacific Time (US & Canada)").strftime("%B %d at %I:%M %p")
  end
  def self.content
  	b = Blog.find('1')
  	b.content
  end
end