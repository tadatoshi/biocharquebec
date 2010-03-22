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
  
end