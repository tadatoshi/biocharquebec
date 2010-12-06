class BlogPostsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index] 

  def index
    @blog_posts = BlogPost.in_current_locale.ordered
  end

  def show
    @blog_post = BlogPost.find(params[:id])
  end

  def new
    @blog_post = BlogPost.new
  end

  def edit
    @blog_post = BlogPost.find(params[:id])
  end

  def create
    @blog_post = BlogPost.new(params[:blog_post].merge(:user_id => current_user.try(:id)))

    respond_to do |format|
      if @blog_post.save
        Blogs::MultipleBlogMailerCaller.send_new_blog_post_mails_to_all_users(@blog_post)
        format.html { redirect_to(blog_posts_url, :notice => 'Blog entry was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @blog_post = BlogPost.find(params[:id])

    respond_to do |format|
      if @blog_post.update_attributes(params[:blog_post])
        format.html { redirect_to(blog_posts_url, :notice => 'Blog entry was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @blog_post = BlogPost.find(params[:id])
    @blog_post.destroy

    respond_to do |format|
      format.html { redirect_to(blog_posts_url) }
    end
  end
end
