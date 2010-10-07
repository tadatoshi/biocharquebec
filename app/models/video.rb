class Video
  include Mongoid::Document

  field :thumbnail_file_path
  field :video_file_path
  field :title

  index :title
  
  # Note: Association from the embedded document didn't work. The following code is kept for a record. 
  # referenced_in :event_session, :class_name => "Events::EventSession"
  
  # TODO: Find a way to get the associated embedded document:
  # Custom method for associating from this embedded document:
  # def event_session
  #   Events::EventSession.first(:conditions => { :video_id => self.id })
  # end
  
  # TODO: Find a way to save event_session when this Video is saved:
  # def event_session(event_session)
  #   event_session.video_id = self.id
  # end
end
