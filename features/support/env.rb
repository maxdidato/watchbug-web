require 'capybara/cucumber'
require 'database_cleaner'
require ::File.expand_path('../../../config/environment', __FILE__)
Capybara.app = Rails.application
Capybara.default_driver = :selenium
include Capybara::DSL
DatabaseCleaner.clean_with(:deletion) # clean once, now
DatabaseCleaner.strategy = :transaction