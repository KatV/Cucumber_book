# require_relative ('../../lib/nice_bank.rb')
require 'nice_bank'
require 'capybara/cucumber'

Capybara.app = Sinatra::Application
Sinatra::Application.set :environment, :test