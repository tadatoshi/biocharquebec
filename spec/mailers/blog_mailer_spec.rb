require 'spec_helper'

describe BlogMailer do
  
  it "should send new blog post e-mail" do
    
    user = User.create!(:username => "temp", :email => "temp@temp.com", :password => "somepassword", :password_confirmation => "somepassword")
    blog_post = BlogPost.create!(:title => "Test blog post", :content => "This is a test blog post.")
    
    BlogMailer.new_blog_post(blog_post, user).deliver
    
  end
  
end
