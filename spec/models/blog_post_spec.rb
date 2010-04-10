require 'spec_helper'

describe BlogPost do
  
  context "MongoDB" do
    
    before(:each) do
      BlogPost.delete_all
    end
    
    after(:each) do
      BlogPost.delete_all
    end
    
    context "Add" do
      
      it "should add a blog entry" do
        
        blog_post_1 = BlogPost.new(:title => "First blog entry", :content => "This is the first entry")
        blog_post_1.save.should be_true
        
        BlogPost.all.should == [blog_post_1]
        
        blog_post_2 = BlogPost.create(:title => "Second blog entry", :content => "This is the second entry")
        
        BlogPost.all.should == [blog_post_1, blog_post_2]
        
      end
      
    end
    
    context "Validation" do
      
      it "should have title" do
        
        lambda do
          blog_post = BlogPost.create(:title => nil)
          blog_post.errors.on(:title).should_not be_nil
        end.should_not change(BlogPost, :count)
        
      end
      
    end
    
  end
  
end
