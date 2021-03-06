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
  end
  user
end

Given /^I am logged in as "([^"]*)" with user name "([^"]*)" and password "([^"]*)"$/ do |email, user_name, password|
  @current_user = create_my_user(:email => email, :user_name => user_name, :password => password)
  visit new_user_session_path
  fill_in("Email", :with => email)
  fill_in("Password", :with => password)
  click_button("Sign in")
end