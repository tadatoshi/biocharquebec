class Admin < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :timeoutable, :lockable, :invitable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
  
  validates :email, :password, :password_confirmation, :presence => true
  validates :password, :confirmation => true
end