Given(/^I have registered using '(.*)' as email and '(.*)' as password$/) do |email, password|
  User.create!(email: email, password: password)
end

But(/^I have not completed my onbording yet$/) do
  User.all.last.update(onboarded: false)
end


And(/^I have completed my onbording/) do
  User.all.last.update(onboarded: true)
end


And(/^the last known position for my device is lat:'(.*)' and long:'(.*)'$/) do |lat, long|
  stub_request(:get, "#{Settings.watchbug_api}/geolocations/#{build(:user).watchbug_id}").
      to_return(:body => {lat: lat, long: long}.to_json)
  stub_request(:get, "http://maps.google.com").to_return(body: 'MAP')
end

And(/^the battery level is '(.*)'$/) do |battery_level|
  stub_request(:get, "#{Settings.watchbug_api}/geolocations/#{build(:user).watchbug_id}").
      to_return(:body => {battery: battery_level}.to_json)
  stub_request(:get, "http://maps.google.com").to_return(body: 'MAP')
end