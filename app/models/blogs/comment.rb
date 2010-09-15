class Blogs::Comment
  include Mongoid::Document

  field :content
  field :locale
  field :user_id

  index :locale
  index :user_id
  
  before_validation :assign_current_locale  

  validates :content, :presence => true
  validates :locale, :presence => true  
  
  embedded_in :blog_post, :inverse_of => :comments

  def user_name
    begin
      user = User.find(self.user_id)
      unless user_name = user.try(:user_name)
        user_name = user.try(:email)
      end
    rescue ActiveRecord::RecordNotFound => err
      user_name = ""
    end
    user_name
  end
  
  private
    def assign_current_locale
      self.locale ||= I18n.locale.to_s
    end  
  
end