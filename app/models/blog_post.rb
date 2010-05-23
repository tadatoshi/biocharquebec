class BlogPost
  include Mongoid::Document
  
  field :title
  field :content
  field :locale

  index :title
  index :locale
  
  before_validate :assign_current_locale

  validates :title, :presence => true
  validates :locale, :presence => true  
  
  embeds_many :comments, :class_name => "Blogs::Comment"
  
  private
    def assign_current_locale
      self.locale ||= I18n.locale.to_s
    end  
  
end