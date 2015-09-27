$LOAD_PATH.unshift(File.expand_path("../../helpers/test",File.dirname(__FILE__)))
require 'capybara/cucumber'
require 'database_cleaner'
require 'factory_girl'
require 'factories'
require 'webmock/cucumber'

ENV["RAILS_ENV"] ||= 'test'
Capybara.server do |app, port|
  require 'rack/handler/thin'
  Rack::Handler::Thin.run(app, :Port => port)
end
WebMock.disable_net_connect!(:allow_localhost => true)
require ::File.expand_path('../../../config/environment', __FILE__)
Capybara.app = Rails.application
Capybara.default_driver = :selenium
DatabaseCleaner.clean_with(:deletion) # clean once, now
DatabaseCleaner.strategy = :deletion
World(FactoryGirl::Syntax::Methods)
def app
  Rails.application
end
Capybara.javascript_driver = :webkit
Capybara.server do |app, port|
  require 'rack/handler/thin'
  Rack::Handler::Thin.run(app, :Port => port)
end
World(Rack::Test::Methods)
