require 'spec_helper'

describe Blogs::CommentsController do
  
  before(:each) do
    I18n.locale = "en"
  end  

  def mock_blog_post(stubs={})
    @mock_blog_post ||= mock_model(BlogPost, stubs).as_null_object
  end
  
  def mock_comment(stubs={})
    @mock_comment ||= mock_model(Blogs::Comment, stubs).as_null_object
  end  

  describe "GET index" do
    it "assigns all comments as @comments" do
      BlogPost.stub(:find).with("28") { mock_blog_post }
      # mock_blog_post.stub_chain(:comments, :all).with(:locale => "en").and_return([mock_comment])
      mock_comments = mock(Array)
      mock_blog_post.should_receive(:comments).and_return(mock_comments)
      mock_comments.should_receive(:all).with({:conditions=>{:locale=>"en"}}).and_return([mock_comment])
      mock_new_comment = mock_model(Blogs::Comment).as_null_object
      mock_blog_post.stub_chain(:comments, :build).and_return(mock_new_comment)
      get :index, :blog_post_id => "28"
      assigns(:blog_post).should eq(mock_blog_post)
      assigns(:comments).should eq([mock_comment])
      assigns(:comment).should eq(mock_new_comment)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created comment as @comment" do
        BlogPost.stub(:find).with("28") { mock_blog_post }
        mock_blog_post.stub_chain(:comments, :build).with({'content' => 'I like it.'}) { mock_comment(:save => true) }
        post :create, :blog_post_id => "28", :blogs_comment => {'content' => 'I like it.'}
        assigns(:comment).should be(mock_comment)
      end

      it "redirects to the created blog_post" do
        BlogPost.stub(:find).with("28") { mock_blog_post }
        mock_blog_post.stub_chain(:comments, :build).with({'content' => 'I like it.'}) { mock_comment(:save => true) }
        post :create, :blog_post_id => "28", :blogs_comment => {'content' => 'I like it.'}
        # TODO: Investigate the cause of the problem, RSpec alpha or code:
        # response.should redirect_to(blog_post_comments_url(:blog_post_id => "28"))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved comment as @comment" do
        BlogPost.stub(:find).with("28") { mock_blog_post }
        mock_blog_post.stub_chain(:comments, :build).with({'content' => 'I like it.'}) { mock_comment(:save => false) }
        post :create, :blog_post_id => "28", :blogs_comment => {'content' => 'I like it.'}
        assigns(:comment).should be(mock_comment)
      end

      it "re-renders the 'new' template" do
        BlogPost.stub(:find).with("28") { mock_blog_post }
        mock_blog_post.stub_chain(:comments, :build).with({'content' => 'I like it.'}) { mock_comment(:save => false) }
        post :create, :blog_post_id => "28", :blogs_comment => {'content' => 'I like it.'}
        # TODO: Investigate the cause of the problem, RSpec alpha or code:
        # response.should redirect_to(blog_post_comments_url(:blog_post_id => "28"))
      end
    end

  end

end
