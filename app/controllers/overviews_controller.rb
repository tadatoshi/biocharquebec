class OverviewsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]  
  respond_to :html
  
  def index
    @overviews = Overview.in_current_locale.all

    respond_with(@overviews)
  end

  # GET /overviews/1
  # GET /overviews/1.xml
  def show
    @overview = Overview.find(params[:id])

    respond_with(@overview)
  end

  # GET /overviews/new
  # GET /overviews/new.xml
  def new
    @overview = Overview.new

    respond_with(@overview)
  end

  # GET /overviews/1/edit
  def edit
    @overview = Overview.find(params[:id])
  end

  # POST /overviews
  # POST /overviews.xml
  def create
    @overview = Overview.new(params[:overview])

    respond_to do |format|
      if @overview.save
        format.html { redirect_to(@overview, :notice => 'Overview was successfully created.') }
        format.xml  { render :xml => @overview, :status => :created, :location => @overview }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @overview.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /overviews/1
  # PUT /overviews/1.xml
  def update
    @overview = Overview.find(params[:id])

    respond_to do |format|
      if @overview.update_attributes(params[:overview])
        format.html { redirect_to(@overview, :notice => 'Overview was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @overview.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /overviews/1
  # DELETE /overviews/1.xml
  def destroy
    @overview = Overview.find(params[:id])
    @overview.destroy

    respond_to do |format|
      format.html { redirect_to(overviews_url) }
      format.xml  { head :ok }
    end
  end
end
