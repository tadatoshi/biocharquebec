require 'spec_helper'

describe Admin do
  
  it "should have email" do
  
    expect do
      admin = Admin.create(:user_name => "temp", :email => nil, :password => "secret", :password_confirmation => "secret")
      admin.errors[:email].should_not be_empty
    end.to change { Admin.count }.by(0)
  
    expect do
      admin = Admin.create(:user_name => "temp", :email => "admin@tadatoshi.ca", :password => "secret", :password_confirmation => "secret")
      admin.errors[:email].should be_empty
    end.to change { Admin.count }.by(1)        
  
  end

  it "should have user name" do

    expect do
      admin = Admin.create(:user_name => nil, :email => "admin@tadatoshi.ca", :password => "secret", :password_confirmation => "secret")
      admin.errors[:user_name].should_not be_empty
    end.to change { Admin.count }.by(0)

    expect do
      admin = Admin.create(:user_name => "temp", :email => "admin@tadatoshi.ca", :password => "secret", :password_confirmation => "secret")
      admin.errors[:user_name].should be_empty
    end.to change { Admin.count }.by(1)

  end
  
  it "should have matching password and password_confirmation" do
  
    expect do
      admin = Admin.create(:user_name => "temp", :email => "admin@tadatoshi.ca", :password => "secret", :password_confirmation => "no secret")
      admin.errors[:password].should_not be_empty
    end.to change { Admin.count }.by(0)
  
    expect do
      admin = Admin.create(:user_name => "temp", :email => "admin@tadatoshi.ca", :password => "secret", :password_confirmation => "secret")
      admin.errors[:password].should be_empty
    end.to change { Admin.count }.by(1)        
  
  end

  it "should have unique email" do

    expect do
      admin = Admin.create(:user_name => "temp", :email => "admin@tadatoshi.ca", :password => "secret", :password_confirmation => "secret")
      admin.errors[:email].should be_empty
    end.to change { Admin.count }.by(1)

    expect do
      admin = Admin.create(:user_name => "temp2", :email => "admin@tadatoshi.ca", :password => "secret", :password_confirmation => "secret")
      admin.errors[:email].should_not be_empty
    end.to change { Admin.count }.by(0)

  end

  it "should have unique user name" do

    expect do
      admin = Admin.create(:user_name => "temp", :email => "admin@tadatoshi.ca", :password => "secret", :password_confirmation => "secret")
      admin.errors[:user_name].should be_empty
    end.to change { Admin.count }.by(1)

    expect do
      admin = Admin.create(:user_name => "temp", :email => "admin2@tadatoshi.ca", :password => "secret", :password_confirmation => "secret")
      admin.errors[:user_name].should_not be_empty
    end.to change { Admin.count }.by(0)

  end

end