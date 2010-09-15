class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :user_name, :first_name, :last_name, :email, :password, :password_confirmation

  validates :user_name, :presence => true, :uniqueness => true

  has_many :blog_posts
end
