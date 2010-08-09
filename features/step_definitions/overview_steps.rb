Given /^the following overviews:$/ do |overviews|
  Overview.create!(overviews.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) overview$/ do |pos|
  visit overviews_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following overviews:$/ do |expected_overviews_table|
  expected_overviews_table.diff!(tableish('table tr', 'td,th'))
end
