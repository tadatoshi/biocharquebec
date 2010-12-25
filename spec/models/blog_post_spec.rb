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
        
        # Causes error with Rspec 2.0.0.beta.22: result should have been changed by 0, but was changed by 0
        # expect do
          blog_post = BlogPost.create(:title => nil, :locale => "en")
          blog_post.errors[:title].should_not be_empty
        # end.to change { BlogPost.count }.by(0)
        
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

        # TODO: BlogPost.all returns Mongoid::Criteria instaed of array of models probably because of lazy loading.
        #       Investigate how to make the query evaluated when should method is called.
        #       http://groups.google.com/group/mongoid/browse_thread/thread/1b80ded372fccee5/ae7276e321cebe09?lnk=gst&q=all+returns+Criteria+object#ae7276e321cebe09
        BlogPost.all.to_a.sort { |blog_post_a, blog_post_b| blog_post_a.title <=> blog_post_b.title }.should == [blog_post_1, blog_post_2]
        
      end
      
    end
    
    context "Scope" do
      
      before(:each) do
        I18n.locale = "en"
      end      
      
      after(:each) do
        I18n.locale = "en"
      end      

      it "should have the current locale and be ordered by id" do     

        blog_post_1 = BlogPost.create(:locale => "fr", :title => "First blog entry", :content => "This is the first entry")
        blog_post_2 = BlogPost.create(:locale => "fr", :title => "Second blog entry", :content => "This is the second entry")
        blog_post_3 = BlogPost.create(:locale => "en", :title => "Third blog entry", :content => "This is the third entry")
        blog_post_4 = BlogPost.create(:locale => "fr", :title => "Fourth blog entry", :content => "This is the fourth entry")
        blog_post_5 = BlogPost.create(:locale => "en", :title => "Fifth blog entry", :content => "This is the fifth entry")

        I18n.locale = "en"
        execute_query_to_models(BlogPost.in_current_locale.ordered).should == [blog_post_5, blog_post_3]
        I18n.locale = "fr"
        execute_query_to_models(BlogPost.in_current_locale.ordered).should == [blog_post_4, blog_post_2, blog_post_1]      

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
      
        BlogPost.all.should == [blog_post_english_1, blog_post_french_1, blog_post_english_2]
        BlogPost.in_current_locale.should == [blog_post_english_1, blog_post_english_2]
      
      end
    
      it "should find blog_post with a keyword" do
      
        blog_post_english_1 = BlogPost.create!(:title => "Some title 1", :content => "This is a temp blog_post", :locale => "en")
        blog_post_french_1 = BlogPost.create!(:title => "Quelque titre 1", :content => "C'est bon. temp", :locale => "fr")
        blog_post_english_2 = BlogPost.create!(:title => "Some title 2", :content => "This is another blog_post", :locale => "en")
        blog_post_english_3 = BlogPost.create!(:title => "Some temp title 3", :content => "This is yet another blog_post", :locale => "en")      
        
        execute_query_to_models(BlogPost.search("temp")).should == [blog_post_english_1, blog_post_english_3]

        # pending "any_of doesn't seem to work" do      
        #   execute_query_to_models(BlogPost.any_of({:title => /^temp/}, {:content => /^temp/})).should == [blog_post_english_1, blog_post_english_3]
        # end
      
      end
      
      it "should find blog_post with a keyword using custom matcher" do
        
        BlogPost.should search_by(:title, :content, :locale => I18n.locale.to_s)
        
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

    it "should get user name for a blog post" do

      user = User.create!(:user_name => "My user name", :email => "user@tadatoshi.ca", :password => "secret", :password_confirmation => "secret")
      blog_post = BlogPost.create!(:user_id => user.id, :title => "Blog post with user 1", :content => "This blog post is associated with a user", :locale => "en")

      blog_post.user_name.should == "My user name"

    end

    it "should get email as user name for a blog post if user name is not assigned (old account)" do

      user = User.new(:user_name => nil, :email => "user@tadatoshi.ca", :password => "secret", :password_confirmation => "secret")
      user.save!(:validate => false) # Saving without running validation in order to simulate the old user without user_name
      blog_post = BlogPost.create!(:user_id => user.id, :title => "Blog post with user 1", :content => "This blog post is associated with a user", :locale => "en")

      blog_post.user_name.should == "user@tadatoshi.ca"

    end

    it "should get blank string for user name when the user associated with the blog post is not found" do

      blog_post = BlogPost.create!(:title => "Blog post with user 1", :content => "This blog post is associated with a user", :locale => "en")

      blog_post.user_name.should == ""

    end

  end
  
end
