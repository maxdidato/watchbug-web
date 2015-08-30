require 'capybara/cucumber'
require 'database_cleaner'
require 'factory_girl'
require 'webmock/cucumber'
WebMock.disable_net_connect!(:allow_localhost => true)
require ::File.expand_path('../../../config/environment', __FILE__)
Capybara.app = Rails.application
Capybara.default_driver = :selenium
include Capybara::DSL
DatabaseCleaner.clean_with(:deletion) # clean once, now
DatabaseCleaner.strategy = :transaction
World(FactoryGirl::Syntax::Methods)
