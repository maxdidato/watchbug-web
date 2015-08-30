Then(/^I should see '(.*)'$/) do |text|
  expect(page).to have_content(text)
end

Then(/^I should see an iframe with google maps pointing to '(.*)'$/) do |expected_coordinates|
  iframe_source = find('iframe')['src']
  coordinates = CGI::parse(URI(iframe_source).query)['q'].first
  expect(coordinates).to eq(expected_coordinates)

end

Then(/^I should see the battery level set to '(.*)'$/) do |battery_level|
  expect(page).to have_content battery_level
end