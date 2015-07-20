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
  def self.load_blogs(section, per_page)
    blogs = []
    current_section = 1
    loaded_blog = 0
    Blog.all.sort_by{|b| b.created_at}.reverse.each_with_index do |blog, i|
      loaded_blog += 1
      if current_section == section
        blogs << blog
      end
      if loaded_blog == per_page
        loaded_blog = 0
        current_section += 1
      end
    end
    blogs
  end
end