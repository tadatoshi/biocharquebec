require 'spec_helper'

describe Blogs::Comment do
  
  context "MongoDB" do
    
    before(:each) do
      Blogs::Comment.delete_all
    end
    
    after(:each) do
      Blogs::Comment.delete_all
    end
    
    context "Validation" do
      
      before(:each) do
        I18n.locale = "en"
      end      
      
      after(:each) do
        I18n.locale = "en"
      end
      
      it "should have blog_post_id" do
        
        expect do
          comment = Blogs::Comment.create(:blog_post_id => nil, :content => "Some comment", :locale => "en")
          # TODO: Find out the reason of the problem:
          # comment.errors.on(:content).should_not be_nil
        end.to change { Blogs::Comment.count }.by(0)
        
      end            
      
      it "should have content" do
        
        expect do
          blog_post = BlogPost.create!(:title => "Some idea", :content => "This is a blog post.")
          comment = blog_post.comments.create(:content => nil, :locale => "en")
          comment.errors.on(:content).should_not be_nil
        end.to change { Blogs::Comment.count }.by(0)
        
      end      
      
      it "should have locale automatically assigned if not assigned" do
      
        expect do
          blog_post = BlogPost.create!(:title => "Some idea", :content => "This is a blog post.")
          comment = blog_post.comments.create(:content => "Some comment", :locale => nil)
          comment.errors[:locale].should be_empty
          comment.locale.should == "en"
        end.to change { Blogs::Comment.count }.by(1)      
      
      end      
      
    end    
    
    context "Add" do
      
      it "should add a blog entry comment" do
        
        blog_post = BlogPost.create!(:title => "Some idea", :content => "This is a blog post.")
        
        comment_1 = blog_post.comments.build(:content => "I like this post")
        comment_1.save.should be_true
        
        Blogs::Comment.all.should == [comment_1]
        
        comment_2 = blog_post.comments.create(:content => "Me, too")
        
        Blogs::Comment.all.should == [comment_1, comment_2]
        
      end
      
    end
    
  end
  
end
