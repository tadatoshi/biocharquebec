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
  
end
