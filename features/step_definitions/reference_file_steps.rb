Given /^the following reference_files:$/ do |reference_files|
  ReferenceFile.create!(reference_files.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) reference_file$/ do |pos|
  visit reference_files_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following reference_files:$/ do |expected_reference_files_table|
  expected_reference_files_table.diff!(tableish('table tr', 'td,th'))
end
