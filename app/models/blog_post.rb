class BlogPost
  include Mongoid::Document
  
  field :title
  field :content
  field :locale
  field :user_id

  index :title
  index :locale
  index :user_id
  
  before_validation :assign_current_locale

  validates :title, :presence => true
  validates :locale, :presence => true  

  embeds_many :comments, :class_name => "Blogs::Comment"

  scope :ordered, desc(:_id)  
  scope :in_current_locale, lambda { where(:locale => I18n.locale.to_s) }
  # scope :search_a_field, lambda { |field, keyword| where_like(field, keyword) }
  scope :search, :where => { :title => "Some title 1" }

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

  class << self

    # def search(keyword)
    #   # where(:locale => I18n.locale.to_s).and(:title => RegExp.new(keyword), :content => RegExp.new(keyword))
    #   # where(:title => RegExp.new(keyword))
    #   # where(:title => /^temp/i)
    #   where(:title => RegExp.new("temp"))
    #   # where(:title => RegExp.new("Some title 1"))
    #   # where(:title => "Some title 1")
    # end
  
  end

  private
    def assign_current_locale
      self.locale ||= I18n.locale.to_s
    end
  
end