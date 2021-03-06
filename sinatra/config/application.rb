require 'rubygems'

env = (ENV["RACK_ENV"] || ENV["RAILS_ENV"] || "development").to_sym

# Set up gems listed in the Gemfile.
gemfile = File.expand_path('../../Gemfile', __FILE__)
begin
  ENV['BUNDLE_GEMFILE'] = gemfile
  require 'bundler'
  Bundler.setup
rescue Bundler::GemNotFound => e
  STDERR.puts e.message
  STDERR.puts "Try running `bundle install`."
  exit!
end if File.exist?(gemfile)

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, env) if defined?(Bundler)

lib_dir = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

MyAppConf = Hashie::Mash.new(:env => env)

[:helpers].each do |initializer|
  require File.expand_path("../initializers/#{initializer}", __FILE__)
end

require File.expand_path("../environments/#{env}", __FILE__)
