Given(/^I navigate to '(.*)'$/) do |url|
 visit(url)
end

When(/^I click '(.*)'$/) do |button|
  click_button button
end