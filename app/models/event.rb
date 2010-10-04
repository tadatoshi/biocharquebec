class Event
  include Mongoid::Document
  field :title, :type => String
  field :date, :type => Date
  field :location, :type => String
  field :description, :type => String
  field :locale, :type => String
  
  before_validation :assign_current_locale

  validates :title, :presence => true
  validates :locale, :presence => true  
  
  embeds_many :sessions, :class_name => "Events::EventSession"   
  
  private
    def assign_current_locale
      self.locale ||= I18n.locale.to_s
    end
       
end