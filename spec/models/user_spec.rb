require 'spec_helper'

describe User do
  subject { User.new(:username => "temp", :email => "temp@temp.com", :password => "somepassword", :password_confirmation => "somepassword") }
  it { should be_valid }
end
