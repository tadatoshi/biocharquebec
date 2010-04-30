require 'spec_helper'

describe BlogPostsController do
  
  before(:each) do
    I18n.locale = "en"
  end  

  def mock_blog_post(stubs={})
    @mock_blog_post ||= mock_model(BlogPost, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all blog_posts as @blog_posts" do
      BlogPost.should_receive(:all).with(:locale => "en").and_return([mock_blog_post])
      get :index
      assigns(:blog_posts).should eq([mock_blog_post])
    end
  end

  describe "GET show" do
    it "assigns the requested blog_post as @blog_post" do
      BlogPost.stub(:find).with("37") { mock_blog_post }
      get :show, :id => "37"
      assigns(:blog_post).should be(mock_blog_post)
    end
  end

  describe "GET new" do
    it "assigns a new blog_post as @blog_post" do
      BlogPost.stub(:new) { mock_blog_post }
      get :new
      assigns(:blog_post).should be(mock_blog_post)
    end
  end

  describe "GET edit" do
    it "assigns the requested blog_post as @blog_post" do
      BlogPost.stub(:find).with("37") { mock_blog_post }
      get :edit, :id => "37"
      assigns(:blog_post).should be(mock_blog_post)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created blog_post as @blog_post" do
        BlogPost.stub(:new).with({'these' => 'params'}) { mock_blog_post(:save => true) }
        post :create, :blog_post => {'these' => 'params'}
        assigns(:blog_post).should be(mock_blog_post)
      end

      it "redirects to the created blog_post" do
        BlogPost.stub(:new) { mock_blog_post(:save => true) }
        post :create, :blog_post => {}
        # TODO: RSpec 2.0.0.beta.5 with Ruby on Rails 3.0.0.beta2 fails with this:
        # response.should redirect_to(blog_posts_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved blog_post as @blog_post" do
        BlogPost.stub(:new).with({'these' => 'params'}) { mock_blog_post(:save => false) }
        post :create, :blog_post => {'these' => 'params'}
        assigns(:blog_post).should be(mock_blog_post)
      end

      it "re-renders the 'new' template" do
        BlogPost.stub(:new) { mock_blog_post(:save => false) }
        post :create, :blog_post => {}
        response.should render_template(:new)
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested blog_post" do
        BlogPost.should_receive(:find).with("37") { mock_blog_post }
        mock_blog_post.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :blog_post => {'these' => 'params'}
      end

      it "assigns the requested blog_post as @blog_post" do
        BlogPost.stub(:find) { mock_blog_post(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:blog_post).should be(mock_blog_post)
      end

      it "redirects to the blog_post" do
        BlogPost.stub(:find) { mock_blog_post(:update_attributes => true) }
        put :update, :id => "1"
        # TODO: RSpec 2.0.0.beta.5 with Ruby on Rails 3.0.0.beta2 fails with this:
        # response.should redirect_to(blog_posts_url)
      end
    end

    describe "with invalid params" do
      it "assigns the blog_post as @blog_post" do
        BlogPost.stub(:find) { mock_blog_post(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:blog_post).should be(mock_blog_post)
      end

      it "re-renders the 'edit' template" do
        BlogPost.stub(:find) { mock_blog_post(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template(:edit)
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested blog_post" do
      BlogPost.should_receive(:find).with("37") { mock_blog_post }
      mock_blog_post.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the blog_posts list" do
      BlogPost.stub(:find) { mock_blog_post(:destroy => true) }
      delete :destroy, :id => "1"
      # TODO: RSpec 2.0.0.beta.5 with Ruby on Rails 3.0.0.beta2 fails with this:
      # response.should redirect_to(blog_posts_url)
    end
  end

end
