class Events::EventSession
  include Mongoid::Document
  field :start_time, :type => Time
  field :end_time, :type => Time
  field :title, :type => String
  field :presenter, :type => String
  field :affiliation, :type => String
  field :video_id, :type => BSON::ObjectId
  field :reference_file_id, :type => BSON::ObjectId  

  embedded_in :event, :inverse_of => :sessions
  # Note: Association from the embedded document didn't work. The following code is kept for a record. 
  # references_one :video
  # references_one :reference_file
  # 
  # attr_reader :video_id, :reference_file_id # To be used by view
  # 
  # # def video_id=(video_id)
  # #   self.video = Video.find(video_id)
  # # end
  # # 
  # # def reference_file_id=(reference_file_id)
  # #   self.reference_file = ReferenceFile.find(reference_file_id)
  # # end  
  
  # Custom method for associating from this embedded document:
  def video
    unless self.video_id.blank?
      Video.find(self.video_id)
    end
  end
  
  def video=(video)
    self.video_id = video.id
  end
  
  # Custom method for associating from this embedded document:
  def reference_file
    unless self.reference_file_id.blank?
      ReferenceFile.find(self.reference_file_id)
    end
  end

  def reference_file=(reference_file)
    self.reference_file_id = reference_file.id
  end  
  
end