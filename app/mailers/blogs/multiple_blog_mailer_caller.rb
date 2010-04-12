class Blogs::MultipleBlogMailerCaller
  
  def self.send_new_blog_post_mails_to_all_users(blog_post)
    User.all.each do |user|
      BlogMailer.new_blog_post(blog_post, user).deliver
    end
  end
  
end