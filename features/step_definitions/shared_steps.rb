Given /^the following (.+) records$/ do |model_name, table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |hash|
    model_name.camelize.constantize.create!(hash)
  end
end

def create_my_user(params)
  unless user = User.find_by_email(params[:email])
    params[:password_confirmation] = params[:password]
    user = User.create!(params)
    # This makes the user look 'confirmed'
    # user.update_attribute(:confirmation_token,nil)
    # user.update_attribute(:confirmed_at,Time.now)
  end
  user
end

# TODO: Find a way to log in using Devise:
Given /^I am logged in as (.*) with password (.*)$/ do |email, password|
  @current_user = create_my_user(:email => email, :password => password)
  visit new_user_session_path
  fill_in("Email", :with => email)
  fill_in("Password", :with => password)
  click_button("Sign in")
  # response.should contain("You are logged in now.")
  # response.body.should =~ /My Lovely App/m
end