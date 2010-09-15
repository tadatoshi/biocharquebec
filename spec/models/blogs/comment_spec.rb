require 'spec_helper'

describe Blogs::Comment do
  
  context "MongoDB" do
    
    before(:each) do
      BlogPost.delete_all
    end
    
    after(:each) do
      BlogPost.delete_all
    end
    
    context "Validation" do
      
      before(:each) do
        I18n.locale = "en"
      end      
      
      after(:each) do
        I18n.locale = "en"
      end
      
      it "should have content" do
        
        blog_post = BlogPost.create!(:title => "Some idea", :content => "This is a blog post.")
        expect do
          comment = blog_post.comments.create(:content => nil, :locale => "en")
          comment.errors[:content].should_not be_empty
        # end.to change { blog_post.comments.count }.by(0) # Note: There seems to be a bug in Mongoid (http://groups.google.com/group/mongoid/browse_thread/thread/e319b50d87327292/6439736088095662?lnk=gst&q=validation#6439736088095662)
        end
        
      end      
      
      it "should have locale automatically assigned if not assigned" do
      
        blog_post = BlogPost.create!(:title => "Some idea", :content => "This is a blog post.")
        expect do
          comment = blog_post.comments.create(:content => "Some comment", :locale => nil)
          comment.errors[:locale].should be_empty
          comment.locale.should == "en"
        end.to change { blog_post.comments.count }.by(1)      
      
      end      
      
    end    
    
    context "Add" do
      
      it "should add a blog entry comment" do
        
        blog_post = BlogPost.create!(:title => "Some idea", :content => "This is a blog post.")
        
        comment_1 = blog_post.comments.build(:content => "I like this post")
        comment_1.save.should be_true
        
        Blogs::Comment.all.should_not == [comment_1] # Because Blogs::Comment is an embedded document inside BlogPost
        blog_post.comments.all.should == [comment_1]
        
        comment_2 = blog_post.comments.create(:content => "Me, too")
        
        Blogs::Comment.all.should_not == [comment_1, comment_2]
        blog_post.comments.all.should == [comment_1, comment_2]
        
      end
      
    end
    
  end

  context "Association between MongoDB and ActiveRecord" do

    before(:each) do
      BlogPost.delete_all
    end

    after(:each) do
      BlogPost.delete_all
    end

    it "should get user name for a blog post comment" do

      user_1 = User.create!(:user_name => "Blogger", :email => "user@tadatoshi.ca", :password => "secret", :password_confirmation => "secret")
      user_2 = User.create!(:user_name => "Commenter", :email => "commenter@tadatoshi.ca", :password => "secret", :password_confirmation => "secret")
      blog_post = BlogPost.create!(:user_id => user_1.id, :title => "Blog post with user 1", :content => "This blog post is associated with a user", :locale => "en")
      blog_post_comment = blog_post.comments.create!(:user_id => user_2.id, :content => "Good post", :locale => "en")

      blog_post.user_name.should == "Blogger"
      blog_post_comment.user_name.should == "Commenter"

    end

    it "should get email as user name for a blog post comment if user name is not assigned (old account)" do

      user_1 = User.create!(:user_name => "Blogger", :email => "user@tadatoshi.ca", :password => "secret", :password_confirmation => "secret")
      user_2 = User.new(:user_name => nil, :email => "commenter@tadatoshi.ca", :password => "secret", :password_confirmation => "secret")
      user_2.save!(:validate => false)
      blog_post = BlogPost.create!(:user_id => user_1.id, :title => "Blog post with user 1", :content => "This blog post is associated with a user", :locale => "en")
      blog_post_comment = blog_post.comments.create!(:user_id => user_2.id, :content => "Good post", :locale => "en")

      blog_post.user_name.should == "Blogger"
      blog_post_comment.user_name.should == "commenter@tadatoshi.ca"

    end

    it "should get blank string for user name when the user associated with the blog post comment is not found" do

      user_1 = User.create!(:user_name => "Blogger", :email => "user@tadatoshi.ca", :password => "secret", :password_confirmation => "secret")
      blog_post = BlogPost.create!(:user_id => user_1.id, :title => "Blog post with user 1", :content => "This blog post is associated with a user", :locale => "en")
      blog_post_comment = blog_post.comments.create!(:content => "Good post", :locale => "en")

      blog_post.user_name.should == "Blogger"
      blog_post_comment.user_name.should == ""

    end

  end
  
end
