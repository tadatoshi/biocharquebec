require 'spec_helper'

describe "blog_posts/index.html.erb" do
  before(:each) do
    # Doesn't work with MongoMapper:
    # assign(:blog_posts, [
    #   stub_model(BlogPost,
    #     :title => "MyString",
    #     :content => "MyText"
    #   ),
    #   stub_model(BlogPost,
    #     :title => "MyString",
    #     :content => "MyText"
    #   )
    # ])
  end

  it "renders a list of blog_posts" do
    # render
    # response.should have_selector("tr>td", :content => "MyString".to_s, :count => 2)
    # response.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
  end
end
