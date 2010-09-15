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

  it "should get user_name or email if user_name doesn't exist for user_name_for_display" do

    user_1 = User.create(:user_name => "temp", :email => "user1@tadatoshi.ca", :password => "secret", :password_confirmation => "secret")

    user_1.user_name_for_display.should == "temp"

    user_2 = User.new(:user_name => nil, :email => "user2@tadatoshi.ca", :password => "secret", :password_confirmation => "secret")
    user_2.save!(:validate => false)

    user_2.user_name_for_display.should == "user2@tadatoshi.ca"

  end


end
