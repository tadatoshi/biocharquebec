require 'spec_helper'

describe BlogEntry do
  
  context "MongoDB" do
    
    before(:each) do
      BlogEntry.delete_all
    end
    
    after(:each) do
      BlogEntry.delete_all
    end
    
    context "Add" do
      
      it "should add a blog entry" do
        
        blog_entry_1 = BlogEntry.new(:title => "First blog entry", :content => "This is the first entry")
        blog_entry_1.save.should be_true
        
        BlogEntry.all.should == [blog_entry_1]
        
        blog_entry_2 = BlogEntry.create(:title => "Second blog entry", :content => "This is the second entry")
        
        BlogEntry.all.should == [blog_entry_1, blog_entry_2]
        
      end
      
    end
    
    context "Validation" do
      
      it "should have title" do
        
        lambda do
          blog_entry = BlogEntry.create(:title => nil)
          blog_entry.errors.on(:title).should_not be_nil
        end.should_not change(BlogEntry, :count)
        
      end
      
    end
    
  end
  
end
