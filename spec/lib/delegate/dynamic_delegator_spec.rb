require 'spec_helper'

describe DynamicDelegator do
  
  it "should get title and content from the delegated model" do
    
    blog_post = BlogPost.create(:title => "Temp title", :content => "This is some temp content.", :locale => "en")
    
    dynamic_delegator = DynamicDelegator.new(blog_post)
    
    # Note: The instance of dynamic_delegator turned out to be BlogPost probably because DynamicDelegator extends BasicObject. Investigate it.
    # dynamic_delegator.should be_instance_of(DynamicDelegator) # DynamicDelagator extends BasicObject and doesn't have instance_of method:
    dynamic_delegator.title.should == "Temp title"
    dynamic_delegator.content.should == "This is some temp content."
    dynamic_delegator.locale.should == "en"
    
  end
  
  it "should get description as content from the delegated model" do
    
    overview = Overview.create!(:title => "Temp title", :description => "This is an overview.", :locale => "en")
    
    dynamic_delegator = DynamicDelegator.new(overview, :method_name_conversion => { :content => :description })

    dynamic_delegator.title.should == "Temp title"
    dynamic_delegator.content.should == "This is an overview."
    dynamic_delegator.locale.should == "en"
    
  end
  
end