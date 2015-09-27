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

Then(/^I should see a popup saying "(.*)"$/) do |message|
  expect(page.driver.browser.switch_to.alert.text).to eq(message)
end


Then(/^I should not see a popup$/) do
 expect{page.driver.browser.switch_to.alert}.to raise_error(Selenium::WebDriver::Error::NoAlertPresentError)
end