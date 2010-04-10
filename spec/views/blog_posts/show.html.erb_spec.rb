require 'spec_helper'

describe "blog_posts/show.html.erb" do
  before(:each) do
    # Doesn't work with MongoMapper:
    # assign(:blog_post, @blog_post = stub_model(BlogPost,
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
