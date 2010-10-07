Given /^the following videos:$/ do |videos|
  videos.hashes.each do |video_params|
    Video.create!(video_params)
  end
end

When /^I delete the (\d+)(?:st|nd|rd|th) video$/ do |pos|
  visit videos_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following videos:$/ do |expected_videos_table|
  expected_videos_table.diff!(tableish('table tr', 'td,th'))
end
