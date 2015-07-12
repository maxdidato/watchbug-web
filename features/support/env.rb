require 'capybara/cucumber'
require ::File.expand_path('../../../config/environment', __FILE__)
Capybara.app = Rails.application
Capybara.default_driver = :selenium
include Capybara::DSL