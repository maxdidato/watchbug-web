Given(/^I have registered using '(.*)' as username and '(.*)' as password$/) do |email,password|
  User.create(email:email,password:password)
end