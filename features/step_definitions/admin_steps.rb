Given /^the following admins:$/ do |admins|
  Admin.create!(admins.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) admin$/ do |pos|
  visit admins_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following admins:$/ do |expected_admins_table|
  expected_admins_table.diff!(tableish('table tr', 'td,th'))
end

def create_my_admin(params)
  unless admin = Admin.find_by_email(params[:email])
    params[:password_confirmation] = params[:password]
    admin = Admin.create!(params)
  end
  admin
end

Given /^I am an administrator logged in as "([^"]*)" with password "([^"]*)"$/ do |email, password|
  @current_admin = create_my_admin(:email => email, :password => password)
  visit new_admin_session_path
  fill_in("Email", :with => email)
  fill_in("Password", :with => password)
  click_button("Sign in")
end
