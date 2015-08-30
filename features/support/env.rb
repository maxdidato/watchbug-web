$LOAD_PATH.unshift(File.expand_path("../../helpers/test",File.dirname(__FILE__)))
require 'capybara/cucumber'
require 'database_cleaner'
require 'factory_girl'
require 'factories'
require 'webmock/cucumber'
ENV["RAILS_ENV"] ||= 'test'
WebMock.disable_net_connect!(:allow_localhost => true)
require ::File.expand_path('../../../config/environment', __FILE__)
Capybara.app = Rails.application
Capybara.default_driver = :selenium
DatabaseCleaner.clean_with(:deletion) # clean once, now
DatabaseCleaner.strategy = :deletion
World(FactoryGirl::Syntax::Methods)
