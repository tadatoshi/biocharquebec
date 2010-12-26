require 'carrierwave/orm/mongoid'

class ReferenceFile
  include Mongoid::Document

  field :title

  index :title

  mount_uploader :file, FileUploader
  
  referenced_in :event_session, :class_name => "Events::EventSession"
  
  scope :ordered, asc(:_id)
  
  class << self

    def search(keyword)
      where(:title => /#{keyword}/i)
    end
  
  end  
      
end
