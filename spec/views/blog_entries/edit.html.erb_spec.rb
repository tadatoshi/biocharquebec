require 'spec_helper'

describe "blog_entries/edit.html.erb" do
  before(:each) do
    # Doesn't work with MongoMapper:
    # assign(:blog_entry, @blog_entry = stub_model(BlogEntry,
    #   :new_record? => false,
    #   :title => "MyString",
    #   :content => "MyText"
    # ))
  end

  it "renders the edit blog_entry form" do
    # render
    # 
    # response.should have_selector("form", :action => blog_entry_path(@blog_entry), :method => "post") do |form|
    #   form.should have_selector("input#blog_entry_title", :name => "blog_entry[title]")
    #   form.should have_selector("textarea#blog_entry_content", :name => "blog_entry[content]")
    # end
  end
end
