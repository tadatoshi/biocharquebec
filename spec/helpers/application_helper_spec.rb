require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ApplicationHelper do
  
  before(:each) do
    I18n.locale = "en"
  end
  
  after(:each) do
    I18n.locale = "en"
  end
 
  it "should get the other locale and I18n language key" do
    # TODO: Error occurs "undefined local variable or method `helper' for #<Rspec::Core::ExampleGroup::NestedLevel_1:0x0000010983d8f0>":
    # helper.pick_other_locale_and_i18n_language_key.should == {:locale => "fr", :i18n_language_key => "french"}
    
    I18n.locale = "fr-CA"
    # helper.pick_other_locale_and_i18n_language_key.should == {:locale => "en", :i18n_language_key => "english"}
  end
  
  # In order to test the method that doesn't use built-in helper methods while helper is not supported in RSpec yet:
  subject do
    class ApplicationHelperHolder; include ApplicationHelper; end
    ApplicationHelperHolder.new
  end
  
  it "should replace locale parameter in the given URL" do
    
    subject.send(:url_with_other_locale, "http://localhost:3000/blog_posts?locale=en").should == "http://localhost:3000/blog_posts?locale=fr"
    subject.send(:url_with_other_locale, "http://localhost:3000/blog_posts?some_parameter=true").should == "http://localhost:3000/blog_posts?some_parameter=true&locale=fr"
    subject.send(:url_with_other_locale, "http://localhost:3000/blog_posts").should == "http://localhost:3000/blog_posts?locale=fr"
    
  end
  
end