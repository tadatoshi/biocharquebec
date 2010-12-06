class ReferenceFilesController < ApplicationController
  before_filter :authenticate_admin!, :except => [:index, :show]

  # GET /reference_files
  # GET /reference_files.xml
  def index
    @reference_files = ReferenceFile.ordered

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reference_files }
    end
  end

  # GET /reference_files/1
  # GET /reference_files/1.xml
  def show
    @reference_file = ReferenceFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @reference_file }
    end
  end

  # GET /reference_files/new
  # GET /reference_files/new.xml
  def new
    @reference_file = ReferenceFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @reference_file }
    end
  end

  # GET /reference_files/1/edit
  def edit
    @reference_file = ReferenceFile.find(params[:id])
  end

  # POST /reference_files
  # POST /reference_files.xml
  def create
    @reference_file = ReferenceFile.new(params[:reference_file])

    respond_to do |format|
      if @reference_file.save
        format.html { redirect_to(@reference_file, :notice => 'Reference file was successfully created.') }
        format.xml  { render :xml => @reference_file, :status => :created, :location => @reference_file }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @reference_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reference_files/1
  # PUT /reference_files/1.xml
  def update
    @reference_file = ReferenceFile.find(params[:id])

    respond_to do |format|
      if @reference_file.update_attributes(params[:reference_file])
        format.html { redirect_to(@reference_file, :notice => 'Reference file was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @reference_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reference_files/1
  # DELETE /reference_files/1.xml
  def destroy
    @reference_file = ReferenceFile.find(params[:id])
    @reference_file.destroy

    respond_to do |format|
      format.html { redirect_to(reference_files_url) }
      format.xml  { head :ok }
    end
  end
end
