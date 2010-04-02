require 'spec_helper'

describe "users/show.html.erb" do
  before(:each) do
    assign(:user, @user = stub_model(User,
      :username => "MyString",
      :email => "MyString",
      :password => "MyString"
    ))
  end

  it "renders attributes in <p>" do
    # TODO: Helper method is not found. Work on this when RSpec fixes that problem:
    # render
    # response.should contain("MyString")
    # response.should contain("MyString")
  end
end
