require 'spec_helper'

describe "blog_entries/show.html.erb" do
  before(:each) do
    # Doesn't work with MongoMapper:
    # assign(:blog_entry, @blog_entry = stub_model(BlogEntry,
    #   :title => "MyString",
    #   :content => "MyText"
    # ))
  end

  it "renders attributes in <p>" do
    # render
    # response.should contain("MyString")
    # response.should contain("MyText")
  end
end
