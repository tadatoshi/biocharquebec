require 'spec_helper'

describe User do
  
  it "should have email" do
  
    expect do
      user = User.create(:email => nil, :password => "secret", :password_confirmation => "secret")
      user.errors[:email].should_not be_empty
    end.to change { User.count }.by(0)
  
    expect do
      user = User.create(:email => "user@tadatoshi.ca", :password => "secret", :password_confirmation => "secret")
      user.errors[:email].should be_empty
    end.to change { User.count }.by(1)        
  
  end
  
  it "should have matching password and password_confirmation" do
  
    expect do
      user = User.create(:email => "user@tadatoshi.ca", :password => "secret", :password_confirmation => "no secret")
      user.errors[:password].should_not be_empty
    end.to change { User.count }.by(0)
  
    expect do
      user = User.create(:email => "user@tadatoshi.ca", :password => "secret", :password_confirmation => "secret")
      user.errors[:password].should be_empty
    end.to change { User.count }.by(1)        
  
  end    

end
