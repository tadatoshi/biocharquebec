require 'spec_helper'

describe "blog_posts/new.html.erb" do
  before(:each) do
    # Doesn't work with MongoMapper:
    # assign(:blog_post, stub_model(BlogPost,
    #   :new_record? => true,
    #   :title => "MyString",
    #   :content => "MyText"
    # ))
  end

  it "renders new blog_post form" do
    # render
    # 
    # response.should have_selector("form", :action => blog_posts_path, :method => "post") do |form|
    #   form.should have_selector("input#blog_post_title", :name => "blog_post[title]")
    #   form.should have_selector("textarea#blog_post_content", :name => "blog_post[content]")
    # end
  end
end
