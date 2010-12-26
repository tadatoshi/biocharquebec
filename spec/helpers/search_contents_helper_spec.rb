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
    Overview.delete_all
    BlogPost.delete_all
    ReferenceFile.delete_all
    Video.delete_all
    
    I18n.locale = "en"
  end

  after(:each) do
    Overview.delete_all
    BlogPost.delete_all
    ReferenceFile.delete_all
    Video.delete_all
  end  

  describe "generate title path" do
    
    it "generates path for the given model" do
      overview = Overview.create!(:title => "Some title 1", :description => "This is a temp overview")
      helper.title_path(overview).should == "/overviews/#{overview.id}"
    end
    
    it "generates path for the given model" do
      video = Video.create!(:title => "Some title 1")
      helper.title_path(video).should == "/videos?id=#{video.id}"
    end    
    
  end
  
end
