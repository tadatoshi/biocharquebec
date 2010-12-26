require 'spec_helper'

describe SearchContent do
  
  # Cleaning is not done with Rspec 2.0.0.beta.22:
  before(:each) do
    Overview.delete_all
    BlogPost.delete_all
    ReferenceFile.delete_all
    Video.delete_all
  end

  after(:each) do
    Overview.delete_all
    BlogPost.delete_all
    ReferenceFile.delete_all
    Video.delete_all
  end  

  context "Delegation" do
  
    it "should get title and content from the delegated model" do
    
      blog_post = BlogPost.create(:title => "Temp title", :content => "This is some temp content.", :locale => "en")
    
      search_content = SearchContent.new(blog_post)
    
      search_content.title.should == "Temp title"
      search_content.content.should == "This is some temp content."
      search_content.locale.should == "en"
    
    end
  
    it "should get description as content from the delegated model" do
    
      overview = Overview.create!(:title => "Temp title", :description => "This is an overview.", :locale => "en")
    
      search_content = SearchContent.new(overview, :method_name_conversion => { :content => :description })

      search_content.title.should == "Temp title"
      search_content.content.should == "This is an overview."
      search_content.locale.should == "en"
    
    end
    
    it "should return nil when the delegated model doesn't have content field" do
    
      reference_file = ReferenceFile.create!(:title => "Temp title")
    
      search_content = SearchContent.new(reference_file)

      search_content.title.should == "Temp title"
      search_content.content.should be_nil
    
    end    
  
  end

  describe "search" do
    
    it "should find search content based on the given query" do
          
      overview_1 = Overview.create!(:title => "Overview 1", :description => "This is a temp overview.", :locale => "en")
      blog_post_1 = BlogPost.create(:title => "Blog post 1", :content => "This is some temp content.", :locale => "en")
      blog_post_2 = BlogPost.create(:title => "Blog post 2", :content => "This is some another content.", :locale => "en")
      
      search_contents = SearchContent.search("temp")
      
      search_contents.should have(2).items
      
      search_contents.first.should be_instance_of(SearchContent)
      search_contents.first.title.should == "Overview 1"
      search_contents.first.content.should == "This is a temp overview."
      search_contents.first.locale.should == "en"
      search_contents.first.model_class.should == Overview
      
      search_contents.second.title.should == "Blog post 1"
      search_contents.second.content.should == "This is some temp content."
      search_contents.second.locale.should == "en"
      search_contents.second.model_class.should == BlogPost      

    end    
    
  end
  
end