Given /^the following event_schedules:$/ do |event_schedules|
  EventSchedule.create!(event_schedules.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) event_schedule$/ do |pos|
  visit event_schedules_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following event_schedules:$/ do |expected_event_schedules_table|
  expected_event_schedules_table.diff!(tableish('table tr', 'td,th'))
end
