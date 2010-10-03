class Events::EventSession
  include Mongoid::Document
  field :start_time, :type => Time
  field :end_time, :type => Time
  field :title, :type => String
  field :presenter, :type => String
  field :affiliation, :type => String
  
  embedded_in :event, :inverse_of => :sessions  
end