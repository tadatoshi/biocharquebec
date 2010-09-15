require 'spec_helper'

describe User do
  
  it "should have email" do
  
    expect do
      user = User.create(:user_name => "temp", :email => nil, :password => "secret", :password_confirmation => "secret")
      user.errors[:email].should_not be_empty
    end.to change { User.count }.by(0)
  
    expect do
      user = User.create(:user_name => "temp", :email => "user@tadatoshi.ca", :password => "secret", :password_confirmation => "secret")
      user.errors[:email].should be_empty
    end.to change { User.count }.by(1)        
  
  end

  it "should have user name" do

    expect do
      user = User.create(:user_name => nil, :email => "user@tadatoshi.ca", :password => "secret", :password_confirmation => "secret")
      user.errors[:user_name].should_not be_empty
    end.to change { User.count }.by(0)

    expect do
      user = User.create(:user_name => "temp", :email => "user@tadatoshi.ca", :password => "secret", :password_confirmation => "secret")
      user.errors[:user_name].should be_empty
    end.to change { User.count }.by(1)

  end
  
  it "should have matching password and password_confirmation" do
  
    expect do
      user = User.create(:user_name => "temp", :email => "user@tadatoshi.ca", :password => "secret", :password_confirmation => "no secret")
      user.errors[:password].should_not be_empty
    end.to change { User.count }.by(0)
  
    expect do
      user = User.create(:user_name => "temp", :email => "user@tadatoshi.ca", :password => "secret", :password_confirmation => "secret")
      user.errors[:password].should be_empty
    end.to change { User.count }.by(1)        
  
  end

  it "should have unique email" do

    expect do
      user = User.create(:user_name => "temp", :email => "user@tadatoshi.ca", :password => "secret", :password_confirmation => "secret")
      user.errors[:email].should be_empty
    end.to change { User.count }.by(1)

    expect do
      user = User.create(:user_name => "temp2", :email => "user@tadatoshi.ca", :password => "secret", :password_confirmation => "secret")
      user.errors[:email].should_not be_empty
    end.to change { User.count }.by(0)

  end

  it "should have unique user name" do

    expect do
      user = User.create(:user_name => "temp", :email => "user@tadatoshi.ca", :password => "secret", :password_confirmation => "secret")
      user.errors[:user_name].should be_empty
    end.to change { User.count }.by(1)

    expect do
      user = User.create(:user_name => "temp", :email => "user2@tadatoshi.ca", :password => "secret", :password_confirmation => "secret")
      user.errors[:user_name].should_not be_empty
    end.to change { User.count }.by(0)

  end

end
