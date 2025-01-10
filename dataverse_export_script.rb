#!/usr/bin/ruby

# run `sudo gem install dataverse dotenv fileutils json` before operating.

require 'dataverse'
require 'dotenv'
require 'fileutils'
require 'json'

config = File.absolute_path(File.join(File.expand_path(__FILE__), '..', '.env.dataverse'))
Dotenv.load(config)

if [ENV['API_URL'], ENV['API_TOKEN'], ENV['PERSISTENT_IDS']].any?(&:nil?)
  puts "Exiting -- This script must be run when accompanied with a file named '.env.dataverse' in the same folder as the script."
  puts "That file must contain the assignments below:"
  puts "     API_URL=<api's url up to and including '/api'>"
  puts "     API_TOKEN=<self explanatory>"
  puts "     PERSISTENT_IDS=<persistent ids without 'doi' separated by commas; for example: '12.34567/S3/ABCDEF,89.12345/S3/GHIJKL>'"
  exit 1
end

persistent_ids = ENV['PERSISTENT_IDS'].split(',')

persistent_ids.each do |id|
  filename = id.gsub(/\W/, "_")
  dataset_obj = Dataverse::Dataset.pid("doi:#{id}")
  sanitized_versions = dataset_obj.versions.map { |v| v.to_s.gsub(/\./, "_") }

  FileUtils.mkdir_p filename

  dataset_obj.versions.each.with_index do |v, i|
    dataset_obj.download("./#{filename}/#{sanitized_versions[i]}.zip", version: v)
  end

  File.write("./#{filename}/metadata.json", dataset_obj.export_metadata('dataverse_json').to_json)
end
