class Event
  include Mongoid::Document
  field :title, :type => String
  field :date, :type => Date
  field :location, :type => String
  field :description, :type => String
  
  embeds_many :sessions, :class_name => "Events::EventSession"  
end
