Given(/^I navigate to '(.*)'$/) do |url|
  visit(url)
end

When(/^I click '(.*)'$/) do |button|
  click_on button
end

And(/^I signed in$/) do
  visit('/users/sign_in')
  fill_in 'Email', with: 'email@domain.com'
  fill_in 'Password', with: 'password'
  click_button 'Log in'
end

Given(/^I have logged in$/) do
  FactoryGirl.lint
  @user = build(:user)
  visit('/users/sign_in')
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_button 'Log in'

end