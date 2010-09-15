class Admin < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :timeoutable, :lockable, :invitable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :user_name, :first_name, :last_name,  :email, :password, :password_confirmation
  
  # TODO: Specifying :validatable to devise call above doesn't work like User model. So validation is added here:
  validates :email, :presence => true, :uniqueness => true
  validates :password, :password_confirmation, :presence => true
  validates :password, :confirmation => true

  validates :user_name, :presence => true, :uniqueness => true
end
