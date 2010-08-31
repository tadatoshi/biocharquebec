require "spec_helper"

describe ReferenceFilesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/reference_files" }.should route_to(:controller => "reference_files", :action => "index")
    end

        it "recognizes and generates #new" do
      { :get => "/reference_files/new" }.should route_to(:controller => "reference_files", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/reference_files/1" }.should route_to(:controller => "reference_files", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/reference_files/1/edit" }.should route_to(:controller => "reference_files", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/reference_files" }.should route_to(:controller => "reference_files", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/reference_files/1" }.should route_to(:controller => "reference_files", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/reference_files/1" }.should route_to(:controller => "reference_files", :action => "destroy", :id => "1")
    end

  end
end
