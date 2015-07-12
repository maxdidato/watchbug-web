And(/^I set '(.*)' as '(.*)'$/) do |value,field_name|
  fill_in field_name.capitalize,with: value
end