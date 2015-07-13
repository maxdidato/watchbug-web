Given(/^I navigate to '(.*)'$/) do |url|
 visit(url)
end

When(/^I click '(.*)'$/) do |button|
  click_on button
end

And(/^I signed in$/) do
  visit('/users/sign_in')
  fill_in 'Email',with: 'email@domain.com'
  fill_in 'Password',with:'password'
  click_button 'Log in'
end