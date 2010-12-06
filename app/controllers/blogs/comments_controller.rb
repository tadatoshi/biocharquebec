class Blogs::CommentsController < ApplicationController
  before_filter :authenticate_user!, :except => :index
  before_filter :get_blog_post

  def index
    @comments = @blog_post.comments.in_current_locale.ordered
    @comment = @blog_post.comments.build
  end

  def create
    @comment = @blog_post.comments.build(params[:blogs_comment].merge(:user_id => current_user.try(:id)))

    if @comment.save
      notice_message = 'Comment was successfully created.'
    else
      notice_message = 'Comment failed to be created.'
    end
    
    redirect_to(blog_post_comments_url(@blog_post), :notice => notice_message)
  end
  
  private
    def get_blog_post
      @blog_post = BlogPost.find(params[:blog_post_id])
    end
  
end
