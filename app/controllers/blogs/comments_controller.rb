class Blogs::CommentsController < ApplicationController
  # Because the following before_filter contains Devise codes which depends on Warden, which is Rails Engine, testing fails. 
  # Hence the before_filter is not activated in test environment:
  before_filter :authenticate_user!, :except => :index
  before_filter :get_blog_post

  def index
    @comments = @blog_post.comments.all(:conditions => { :locale => I18n.locale.to_s })
    @comment = @blog_post.comments.build
  end

  def create
    @comment = @blog_post.comments.build(params[:blogs_comment])

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
