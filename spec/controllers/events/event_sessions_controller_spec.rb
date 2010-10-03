require 'spec_helper'

describe Events::EventSessionsController do
  
  before(:each) do
    sign_in mock_admin
  end
  
  def mock_admin(stubs={})
    @mock_admin ||= mock_model(Admin, stubs).as_null_object
  end  

  def mock_event(stubs={})
    @mock_event ||= mock_model(Event, stubs).as_null_object
  end

  def mock_event_session(stubs={})
    @mock_event_session ||= mock_model(Events::EventSession, stubs).as_null_object
  end

  describe "GET new" do
    it "assigns a new event_session as @event_session" do      
      # Event.should_receive(:find).with("23").and_return(mock_event)
      mock_event.stub_chain(:sessions, :build) { mock_event_session }
      get :new, :event_id => "23"
      # assigns(:event).should eq(mock_event)
      # assigns(:event_session).should be(mock_event_session)
    end
  end

  describe "GET edit" do
    it "assigns the requested event_session as @event_session" do
      mock_event.stub_chain(:sessions, :find).with("37") { mock_event_session }
      get :edit, :event_id => "23", :id => "37"
      # assigns(:event_session).should be(mock_event_session)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "redirects to the event" do
        mock_event.stub_chain(:sessions, :build).with({'title' => 'opening note'}) { mock_event_session(:save => true) }
        post :create, :event_id => "23", :event_session => {'title' => 'opening note'}
        # assigns(:event_session).should be(mock_event_session)
        # response.should redirect_to(event_url(mock_event))
      end
    end

    describe "with invalid params" do
      it "re-renders the 'new' template" do
        mock_event.stub_chain(:sessions, :build).with({'title' => 'opening note'}) { mock_event_session(:save => false) }
        post :create, :event_id => "23", :event_session => {'title' => 'opening note'}
        # assigns(:event_session).should be(mock_event_session)
        # response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested event_session and redirects to event show action" do
        mock_event.stub_chain(:sessions, :find).with("37") { mock_event_session(:update_attributes => true) }
        put :update, :event_id => "23", :id => "37", :event_session => {'title' => 'opening note'}
        # assigns(:event_session).should be(mock_event_session)
        # response.should redirect_to(event_url(mock_event))
      end
    end

    describe "with invalid params" do
      it "re-renders the 'edit' template" do
        mock_event.stub_chain(:sessions, :find).with("37") { mock_event_session(:update_attributes => false) }
        put :update, :event_id => "23", :id => "37"
        # assigns(:event_session).should be(mock_event_session)
        # response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested event_session" do
      mock_event.stub_chain(:sessions, :find).with("37") { mock_event_session }
      # mock_event_session.should_receive(:destroy)
      delete :destroy, :event_id => "23", :id => "37"
    end

    it "redirects to the event" do
      mock_event.stub_chain(:sessions, :find) { mock_event_session }
      delete :destroy, :event_id => "23", :id => "1"
      # response.should redirect_to(event_url(mock_event))
    end
  end

end