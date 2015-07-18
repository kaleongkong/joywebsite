class BlogController < ApplicationController
  def add_blog
    b = Blog.new
    b.id = SecureRandom.hex
    b.title = params[:blog_title]
    b.content = params[:blog_content]
    b.save
    redirect_to :controller=> 'main',:action=>'blog', :sent => true
  end
  def edit_blog
  	bid = params[:edit_blog_id]
  	b = Blog.find(bid)
  	b.title = params[:edit_blog_title]
  	b.content = params[:edit_blog_content]
  	b.save
  	redirect_to :controller=> 'main',:action=>'blog', :sent => true
  end
  def delete_blog
  end
end