# frozen_string_literal: true
require 'dataverse'
require 'fileutils'
require 'json'

class DataverseApiInterface
  def initialize(persistent_ids: nil)
    @persistent_ids = persistent_ids
  end

  def export_datasets
    @persistent_ids.each do |id|
      @filename = id.gsub(/\W/, "_")
      @dataset_obj = Dataverse::Dataset.pid(id)

      FileUtils.mkdir_p @filename
      download_dataset_versions
      File.write("./#{@filename}/metadata.json", @dataset_obj.export_metadata('dataverse_json').to_json)
    end
  end

  def retrieve_pids
    dataset_id_array = []
    emory_collection = Dataverse::Dataverse.id('Emory')

    emory_collection.each_dataset { |ds| dataset_id_array << ds.pid }
    File.open("./dataset_pids.txt", "w+") { |f| f.puts(dataset_id_array) }
  end

  private

  def sanitized_versions
    @dataset_obj.versions.map { |v| v.to_s.gsub(/\./, "_") }
  end

  def download_dataset_versions
    @dataset_obj.versions.each.with_index do |v, i|
      @dataset_obj.download("./#{@filename}/#{sanitized_versions[i]}.zip", version: v)
    end
  end
end
