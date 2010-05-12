class BlogPost
  include MongoMapper::Document
  
  key :title, String, :required => true, :index => true
  key :content, String
  key :locale, String, :required => true, :index => true
  
  before_validation :assign_current_locale
  
  many :comments, :class_name => "Blogs::Comment"
  
  private
    def assign_current_locale
      self.locale ||= I18n.locale.to_s
    end  
  
end
