class BlogController < ApplicationController
  def add_blog
    b = Blog.new
    b.id = rand(99999)
    b.title = params[:blog_title]
    b.content = params[:blog_content]
    b.save
    redirect_to :controller=> 'main',:action=>'blog'
  end
  def edit_blog
    new_params = {}
    params.each do |k, v|
      next unless k.include?('_')
      key = k.split('_')
      key.pop
      key = key.join('_')
      new_params[key] = v
    end
  	bid = new_params['edit_blog_id']
  	b = Blog.find(bid)
  	b.title = new_params['edit_blog_title']
  	b.content = new_params['edit_blog_content']
  	b.save
  	redirect_to :controller=> 'main',:action=>'blog',:current_page=>params[:current_page]
  end
  def delete_blog
  end
end