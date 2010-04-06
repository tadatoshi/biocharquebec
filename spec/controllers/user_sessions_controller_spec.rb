require 'spec_helper'

describe UserSessionsController do

  def mock_user_session(stubs={})
    @mock_user_session ||= mock_model(UserSession, stubs).as_null_object
  end

  describe "GET new" do
    it "assigns a new user_session as @user_session" do
      # TODO: Helper method doesn't work well. Work on this when RSpec fixes that problem:
      # UserSession.stub(:new) { mock_user_session }
      # get :new
      # assigns(:user_session).should be(mock_user_session)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created user_session as @user_session" do
        UserSession.stub(:new).with({'these' => 'params'}) { mock_user_session(:save => true) }
        post :create, :user_session => {'these' => 'params'}
        assigns(:user_session).should be(mock_user_session)
      end

      it "redirects to the created user_session" do
        UserSession.stub(:new) { mock_user_session(:save => true) }
        post :create, :user_session => {}
        # TODO: RSpec 2.0.0.beta.5 with Ruby on Rails 3.0.0.beta2 fails with this:
        # response.should redirect_to(root_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user_session as @user_session" do
        # TODO: Helper method doesn't work well. Work on this when RSpec fixes that problem:
        # UserSession.stub(:new).with({'these' => 'params'}) { mock_user_session(:save => false) }
        # post :create, :user_session => {'these' => 'params'}
        # assigns(:user_session).should be(mock_user_session)
      end

      it "re-renders the 'new' template" do
        # TODO: Helper method doesn't work well. Work on this when RSpec fixes that problem:
        # UserSession.stub(:new) { mock_user_session(:save => false) }
        # post :create, :user_session => {}
        # response.should render_template('new')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested user_session" do
      UserSession.should_receive(:find) { mock_user_session }
      mock_user_session.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the user_sessions list" do
      UserSession.stub(:find) { mock_user_session(:destroy => true) }
      delete :destroy, :id => "1"
      # TODO: RSpec 2.0.0.beta.5 with Ruby on Rails 3.0.0.beta2 fails with this:
      # response.should redirect_to(root_url)
    end
  end

end
