class EventsController < ApplicationController
  
  before_filter :authenticate_admin!, :except => [:show, :index]  
  
  def index
    @events = Event.in_current_locale.ordered
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to(events_url, :notice => "#{t('event.event')} #{t('common.was_successfully_added')}") }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to(@event, :notice => "#{t('event.event')} #{t('common.was_successfully_updated')}") }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
    end
  end
end