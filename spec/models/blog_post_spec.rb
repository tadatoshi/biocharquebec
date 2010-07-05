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
          blog_post.errors[:title].should_not be_empty
        end.to change { BlogPost.count }.by(0)
        
        expect do
          blog_post = BlogPost.create(:title => "Some title", :locale => "en")
          blog_post.errors[:title].should be_empty
        end.to change { BlogPost.count }.by(1)        
        
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
    
    context "Search" do
      
      before(:each) do
        I18n.locale = "en"
      end      
      
      after(:each) do
        I18n.locale = "en"
      end       
    
      it "should get all for the current locale" do
      
        blog_post_english_1 = BlogPost.create!(:title => "Some title 1", :locale => "en")
        blog_post_french_1 = BlogPost.create!(:title => "Quelque titre 1", :locale => "fr")
        blog_post_english_2 = BlogPost.create!(:title => "Some title 2", :locale => "en")
      
        # TODO: The return value fractuates between actual data and the instance of Mongoid Criteria:
        # BlogPost.all.should == [blog_post_english_1, blog_post_french_1, blog_post_english_2]
        # BlogPost.in_current_locale.should == [blog_post_english_1, blog_post_english_2]
      
      end
    
      # it "should find blog_post with a keyword" do
      # 
      #   blog_post_english_1 = BlogPost.create!(:title => "Some title 1", :content => "This is a temp blog_post", :locale => "en")
      #   blog_post_french_1 = BlogPost.create!(:title => "Quelque titre 1", :content => "C'est bon. temp", :locale => "fr")
      #   blog_post_english_2 = BlogPost.create!(:title => "Some title 2", :content => "This is another blog_post", :locale => "en")
      #   blog_post_english_3 = BlogPost.create!(:title => "Some temp title 3", :content => "This is yet another blog_post", :locale => "en")      
      # 
      #   # BlogPost.where(:locale => I18n.locale).should == [blog_post_english_1, blog_post_english_3]
      #   #       
      #   # BlogPost.criteria.and(:title => "temp", :content => "temp").should == [blog_post_english_1, blog_post_english_3]
      # 
      #   # BlogPost.search("temp").should == [blog_post_english_1, blog_post_english_3]
      #   BlogPost.search.should == [blog_post_english_1, blog_post_english_3]
      # 
      # end
    
    end    
    
  end
  
end
