class Events::EventSessionsController < ApplicationController
  
  before_filter :authenticate_admin!
  before_filter :get_event  

  def new
    @event_session = @event.sessions.build
  end

  def edit
    @event_session = @event.sessions.find(params[:id])
  end

  def create
    @event_session = @event.sessions.build(params[:events_event_session])

    respond_to do |format|
      if @event_session.save
        format.html { redirect_to(event_url(@event), :notice => 'Event session was successfully created.') }
      else
        format.html { render "new" }
      end
    end
  end

  def update
    @event_session = @event.sessions.find(params[:id])

    respond_to do |format|
      if @event_session.update_attributes(params[:events_event_session])
        format.html { redirect_to(event_url(@event), :notice => 'Event session was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @event_session = @event.sessions.find(params[:id])
    @event_session.destroy

    respond_to do |format|
      format.html { redirect_to(event_url(@event)) }
    end
  end
  
  private
    def get_event
      @event = Event.find(params[:event_id])
    end  
end
