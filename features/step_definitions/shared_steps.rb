Given /^the following (.+) records$/ do |model_name, table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |hash|
    model_name.camelize.constantize.create!(hash)
  end
end

# TODO: Find a way to log in using Devise:
Given /^I am logged in$/ do
  visit path_to("the homepage")
  # response.should contain("Sign up")
  click_link "Sign up"
  fill_in("Email", :with => "temp@temp.ca")
  fill_in("Password", :with => "1234")
  fill_in("Password Confirmation", :with => "1234")
  click_button "Sign up"
  # response.should contain("You are logged in now.")
end