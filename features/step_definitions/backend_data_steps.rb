Given(/^I have registered using '(.*)' as username and '(.*)' as password$/) do |email,password|
  User.create!(email:email,password:password)
end

But(/^I have not completed my onbording yet$/) do
  User.all.last.update(onboarded:false)
end