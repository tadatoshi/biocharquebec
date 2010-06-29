class Overview < ActiveRecord::Base
  
  validates :title, :presence => true
  validates :locale, :presence => true
  
  before_validation :assign_current_locale
  
  scope :in_current_locale, where(:locale => I18n.locale.to_s)
  scope :search_a_field, lambda { |field, keyword| where_like(field, keyword) }
  
  def self.search(keyword)
    # search_a_field(:description, keyword)
    # search_a_field(:title, keyword).search_a_field(:description, keyword)
    # where_like(:title, keyword).where_like(:description, keyword) # Note: This creates AND condition.
    
    in_current_locale.where("title LIKE ? OR description LIKE ?", "%#{keyword}%", "%#{keyword}%")
  end  
  
  def self.where_like(field, keyword)
    where("#{field} LIKE ?", "%#{keyword}%")
  end  
  
  private
    def assign_current_locale
      self.locale ||= I18n.locale.to_s
    end
  
end
