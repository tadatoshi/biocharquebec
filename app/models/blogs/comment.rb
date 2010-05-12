class Blogs::Comment
  include MongoMapper::Document

  key :blog_post_id, ObjectId, :required => true, :index => true
  key :content, String, :required => true
  key :locale, String, :required => true, :index => true
  
  before_validation :assign_current_locale
  
  belongs_to :blog_post
  
  private
    def assign_current_locale
      self.locale ||= I18n.locale.to_s
    end  
  
end