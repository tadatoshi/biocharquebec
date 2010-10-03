require "spec_helper"

describe Events::EventSessionsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/events/2/sessions" }.should route_to(:controller => "events/event_sessions", :action => "index", :event_id => "2")
    end

    it "recognizes and generates #new" do
      { :get => "/events/2/sessions/new" }.should route_to(:controller => "events/event_sessions", :action => "new", :event_id => "2")
    end

    it "recognizes and generates #show" do
      { :get => "/events/2/sessions/1" }.should route_to(:controller => "events/event_sessions", :action => "show", :event_id => "2", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/events/2/sessions/1/edit" }.should route_to(:controller => "events/event_sessions", :action => "edit", :event_id => "2", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/events/2/sessions" }.should route_to(:controller => "events/event_sessions", :action => "create", :event_id => "2")
    end

    it "recognizes and generates #update" do
      { :put => "/events/2/sessions/1" }.should route_to(:controller => "events/event_sessions", :action => "update", :event_id => "2", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/events/2/sessions/1" }.should route_to(:controller => "events/event_sessions", :action => "destroy", :event_id => "2", :id => "1")
    end

  end
end