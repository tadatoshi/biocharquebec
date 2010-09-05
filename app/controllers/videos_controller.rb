class VideosController < ApplicationController
  before_filter :authenticate_admin!, :except => :index
  respond_to :html

  def index
    @videos = Video.all
    respond_with(@videos)
  end

  def show
    @video = Video.find(params[:id])
    respond_with(@video)
  end

  def new
    @video = Video.new
    respond_with(@video)
  end

  def edit
    @video = Video.find(params[:id])
  end

  def create
    @video = Video.new(params[:video])

    respond_to do |format|
      if @video.save
        format.html { redirect_to(@video, :notice => "#{t('video.video')} #{t('common.was_successfully_created')}") }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @video = Video.find(params[:id])

    respond_to do |format|
      if @video.update_attributes(params[:video])
        format.html { redirect_to(@video, :notice => "#{t('video.video')} #{t('common.was_successfully_updated')}") }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy

    respond_to do |format|
      format.html { redirect_to(videos_url) }
    end
  end
end
