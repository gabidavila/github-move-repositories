require 'dotenv/load'
require 'bundler/setup'
Bundler.require
require 'capybara/rspec'

GITHUB = {
  :access_token => ENV['GITHUB_ACCESS_TOKEN'],
  :login => ENV['GITHUB_USERNAME'],
  :password => ENV['GITHUB_PASSWORD'],
  :destination_user => ENV['GITHUB_USER_TO_MOVE_REPOSITORIES_FOR'],
  :origin_user => ENV['GITHUB_USER_TO_MOVE_REPOSITORIES_FROM']
}
Capybara.app_host = 'https://github.com'
Capybara.current_driver = Capybara.javascript_driver
Capybara.run_server = false # don't start Rack

require_relative '../lib/github'