class Events::EventSessionsController < ApplicationController
  
  before_filter :authenticate_admin!
  before_filter :get_event  

  def new
    @event_session = @event.sessions.build
  end

  def edit
    @event_session = @event.sessions.find(params[:id])
    unless params[:add_video].blank?
      @add_video = params[:add_video]
      @videos = Video.all
    end
    unless params[:add_reference_file].blank?
      @add_reference_file = params[:add_reference_file]
      @reference_files = ReferenceFile.all
    end
  end

  def create
    @event_session = @event.sessions.build(params[:events_event_session])

    respond_to do |format|
      if @event_session.save
        format.html { redirect_to(event_url(@event), :notice => "#{t('event.event_session')} #{t('common.was_successfully_added')}") }
      else
        format.html { render "new" }
      end
    end
  end

  def update
    @event_session = @event.sessions.find(params[:id])

    respond_to do |format|
      # if !params[:events_event_session]["video_id"].blank? && assign_video(@event, @event_session, params[:events_event_session]["video_id"])
      #   format.html { redirect_to(event_url(@event), :notice => 'Event session was successfully updated.') }
      # elsif !params[:events_event_session]["reference_file_id"].blank? && assgin_reference_file(@event, @event_session, params[:events_event_session]["reference_file_id"])
      #   format.html { redirect_to(event_url(@event), :notice => 'Event session was successfully updated.') }
      # elsif @event_session.update_attributes(params[:events_event_session])
      if @event_session.update_attributes(params[:events_event_session])
        format.html { redirect_to(event_url(@event), :notice => "#{t('event.event_session')} #{t('common.was_successfully_updated')}") }
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
    
    # def assign_video(event, event_session, video_id)
    #   event_session.video = Video.find(video_id)
    #   event.save
    # end
    # 
    # def assgin_reference_file(event, event_session, reference_file_id)
    #   event_session.reference_file = ReferenceFile.find(reference_file_id)
    #   event.save
    # end

end