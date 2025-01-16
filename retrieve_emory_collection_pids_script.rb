#!/usr/bin/ruby

# run `sudo gem install dataverse dotenv fileutils json` before operating.

require 'dotenv'
require_relative 'dataverse_api_interface'

config = File.absolute_path(File.join(File.expand_path(__FILE__), '..', '.env.dataverse'))
Dotenv.load(config)

if [ENV['API_URL'], ENV['API_TOKEN']].any?(&:nil?)
  puts "Exiting -- This script must be run when accompanied with files named '.env.dataverse' and 'dataverse_api_interface.rb' in the same folder as the script."
  puts "That file must contain the assignments below:"
  puts "     API_URL=<api's url up to and including '/api'>"
  puts "     API_TOKEN=<self explanatory>"
  exit 1
end

DataverseApiInterface.new.retrieve_pids
