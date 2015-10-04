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

When(/^an alarm is generated for (my|another) watchbug id$/) do |person|
  watchbug_id = @user.watchbug_id
  watchbug_id = watchbug_id.to_i+1 if (person=='another')
  post("/alarms/"+watchbug_id.to_s)
end

And(/^the api server(| does not) accept(|s) the protection mode request$/) do |accepts,_|
  stub_request(:post, "#{Settings.watchbug_api}/#{@user.watchbug_id}/request")
      .with(body:{type:'protection_mode'}.to_json).to_return(status: accepts.empty? ? 201 : 401)
end