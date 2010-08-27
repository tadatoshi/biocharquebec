require 'spec_helper'

describe ReferenceFilesController do

  def mock_reference_file(stubs={})
    @mock_reference_file ||= mock_model(ReferenceFile, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all reference_files as @reference_files" do
      ReferenceFile.stub(:all) { [mock_reference_file] }
      get :index
      assigns(:reference_files).should eq([mock_reference_file])
    end
  end

  describe "GET show" do
    it "assigns the requested reference_file as @reference_file" do
      ReferenceFile.stub(:find).with("37") { mock_reference_file }
      get :show, :id => "37"
      assigns(:reference_file).should be(mock_reference_file)
    end
  end

  describe "GET new" do
    it "assigns a new reference_file as @reference_file" do
      ReferenceFile.stub(:new) { mock_reference_file }
      get :new
      assigns(:reference_file).should be(mock_reference_file)
    end
  end

  describe "GET edit" do
    it "assigns the requested reference_file as @reference_file" do
      ReferenceFile.stub(:find).with("37") { mock_reference_file }
      get :edit, :id => "37"
      assigns(:reference_file).should be(mock_reference_file)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created reference_file as @reference_file" do
        ReferenceFile.stub(:new).with({'these' => 'params'}) { mock_reference_file(:save => true) }
        post :create, :reference_file => {'these' => 'params'}
        assigns(:reference_file).should be(mock_reference_file)
      end

      it "redirects to the created reference_file" do
        ReferenceFile.stub(:new) { mock_reference_file(:save => true) }
        post :create, :reference_file => {}
        response.should redirect_to(reference_file_url(mock_reference_file))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved reference_file as @reference_file" do
        ReferenceFile.stub(:new).with({'these' => 'params'}) { mock_reference_file(:save => false) }
        post :create, :reference_file => {'these' => 'params'}
        assigns(:reference_file).should be(mock_reference_file)
      end

      it "re-renders the 'new' template" do
        ReferenceFile.stub(:new) { mock_reference_file(:save => false) }
        post :create, :reference_file => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested reference_file" do
        ReferenceFile.should_receive(:find).with("37") { mock_reference_file }
        mock_reference_file.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :reference_file => {'these' => 'params'}
      end

      it "assigns the requested reference_file as @reference_file" do
        ReferenceFile.stub(:find) { mock_reference_file(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:reference_file).should be(mock_reference_file)
      end

      it "redirects to the reference_file" do
        ReferenceFile.stub(:find) { mock_reference_file(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(reference_file_url(mock_reference_file))
      end
    end

    describe "with invalid params" do
      it "assigns the reference_file as @reference_file" do
        ReferenceFile.stub(:find) { mock_reference_file(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:reference_file).should be(mock_reference_file)
      end

      it "re-renders the 'edit' template" do
        ReferenceFile.stub(:find) { mock_reference_file(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested reference_file" do
      ReferenceFile.should_receive(:find).with("37") { mock_reference_file }
      mock_reference_file.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the reference_files list" do
      ReferenceFile.stub(:find) { mock_reference_file }
      delete :destroy, :id => "1"
      response.should redirect_to(reference_files_url)
    end
  end

end
