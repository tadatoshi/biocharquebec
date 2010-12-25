require 'spec_helper'

describe SearchContentsController do

  def mock_search_content(stubs={})
    @mock_search_content ||= mock(SearchContent, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all search_contents as @search_contents" do
      SearchContent.should_receive(:search).with("temp").and_return([mock_search_content])
      get :index, :query => "temp"
      assigns(:search_contents).should eq([mock_search_content])
    end
  end

end
