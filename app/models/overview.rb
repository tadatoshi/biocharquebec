class Overview < ActiveRecord::Base
  
  validates :title, :presence => true
  validates :locale, :presence => true
  
  before_validation :assign_current_locale
  
  scope :in_current_locale, lambda { where("locale = ?", I18n.locale.to_s) }
  
  private
    def assign_current_locale
      self.locale ||= I18n.locale.to_s
    end
  
end
