class BlogMailer < ActionMailer::Base
  
  default :from => "admin@biocharquebec.org"
  
  def new_blog_post(blog_post, user)
    @blog_post = blog_post
    # attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png") 
    mail(:to => user.email, :subject => t("blog.mail.new_blog_post"))
  end

end
