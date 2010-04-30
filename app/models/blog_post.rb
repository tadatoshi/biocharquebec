class BlogPost
  include MongoMapper::Document
  
  key :title, String, :required => true
  key :content, String
  key :locale, String, :required => true
  
  before_validation :assign_current_locale
  
  private
    def assign_current_locale
      self.locale ||= I18n.locale.to_s
    end  
  
end
