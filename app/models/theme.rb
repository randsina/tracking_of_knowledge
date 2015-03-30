class Theme < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  include Searchable
end

# Delete the previous articles index in Elasticsearch
Theme.__elasticsearch__.client.indices.delete index: Theme.index_name rescue nil

# Create the new index with the new mapping
Theme.__elasticsearch__.client.indices.create \
  index: Theme.index_name,
  body: { settings: Theme.settings.to_hash, mappings: Theme.mappings.to_hash }

# Index all article records from the DB to Elasticsearch
Theme.import
