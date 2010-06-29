require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the SearchContentsHelper. For example:
# 
# describe SearchContentsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe SearchContentsHelper do
  
  before(:each) do
    I18n.locale = "en"
  end  

  describe "generate title path" do
    
    it "generates path for the given model" do
      overview_1 = Overview.create!(:title => "Some title 1", :description => "This is a temp overview")
      helper.title_path(overview_1).should == "/overviews/#{overview_1.id}"
    end
    
  end
  
end
