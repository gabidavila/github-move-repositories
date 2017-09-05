require 'dotenv/load'
require 'bundler/setup'
Bundler.require
require 'capybara/rspec'
require_relative '../config/environment'

Capybara.app_host = 'https://github.com'
Capybara.current_driver = Capybara.javascript_driver
Capybara.run_server = false