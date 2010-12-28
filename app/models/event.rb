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
  
  scope :ordered, desc(:_id)  
  scope :in_current_locale, lambda { where(:locale => I18n.locale.to_s) }    
  
  class << self

    def search(keyword)
      in_current_locale.where("this.title.match(/#{keyword}/i) || this.description.match(/#{keyword}/i)")
    end
    
    def search_embedded(keyword)
      in_current_locale.where("sessions.title" => Regexp.new(keyword))
      # Following doesn't work:
      # in_current_locale.where("this.sessions.title.match(/#{keyword}/i) || this.sessions.presenter.match(/#{keyword}/i) || this.sessions.affiliation.match(/#{keyword}/i)")
    end

  end  

  private
    def assign_current_locale
      self.locale ||= I18n.locale.to_s
    end
       
end