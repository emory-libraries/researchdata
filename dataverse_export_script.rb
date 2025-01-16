#!/usr/bin/ruby

# run `sudo gem install dataverse dotenv fileutils json` before operating.

require 'dotenv'
require_relative 'dataverse_api_interface'

config = File.absolute_path(File.join(File.expand_path(__FILE__), '..', '.env.dataverse'))
Dotenv.load(config)

if [ENV['API_URL'], ENV['API_TOKEN'], ENV['PERSISTENT_IDS']].any?(&:nil?)
  puts "Exiting -- This script must be run when accompanied with files named '.env.dataverse' and 'dataverse_api_interface.rb' in the same folder as the script."
  puts "That file must contain the assignments below:"
  puts "     API_URL=<api's url up to and including '/api'>"
  puts "     API_TOKEN=<self explanatory>"
  puts "     PERSISTENT_IDS=<persistent ids separated by commas; for example: 'doi:12.34567/S3/ABCDEF,doi:89.12345/S3/GHIJKL,hdl:1902.29/11806'>"
  exit 1
end

persistent_ids = ENV['PERSISTENT_IDS'].split(',')

DataverseApiInterface.new(persistent_ids:).export_datasets
