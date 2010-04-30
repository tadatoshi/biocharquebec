require 'spec_helper'

describe BlogPost do
  
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
      
      it "should have title" do
        
        expect do
          blog_post = BlogPost.create(:title => nil, :locale => "en")
          blog_post.errors.on(:title).should_not be_nil
        end.to change { BlogPost.count }.by(0)
        
      end
      
      it "should have locale automatically assigned if not assigned" do
      
        expect do
          blog_post = BlogPost.create(:title => "Some title", :locale => nil)
          blog_post.errors[:locale].should be_empty
          blog_post.locale.should == "en"
        end.to change { BlogPost.count }.by(1)      
      
      end      
      
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
    
  end
  
end
