class Blogs::Comment
  include Mongoid::Document

  field :content
  field :locale

  index :locale
  
  before_validation :assign_current_locale  

  validates :content, :presence => true
  validates :locale, :presence => true  
  
  embedded_in :blog_post, :inverse_of => :comments
  
  private
    def assign_current_locale
      self.locale ||= I18n.locale.to_s
    end  
  
end