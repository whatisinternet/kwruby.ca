require 'middleman'
require 'rspec'
require 'capybara/rspec'
require 'dotenv'
require 'vcr'
require 'webmock/rspec'
require 'meetup_client'

Dotenv.load

MeetupClient.configure do |config|
  config.api_key = ENV['MEETUP_API_KEY']
end
require_relative '../lib/meetup_feed'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.allow_http_connections_when_no_cassette = true
end

Capybara.app = Middleman::Application.server.inst do
  set :root, File.expand_path(File.join(File.dirname(__FILE__), '..'))
  set :environment, :development
  set :show_exceptions, false
end
