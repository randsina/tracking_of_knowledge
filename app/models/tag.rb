class Tag < ActiveRecord::Base
  include Searchable
end

# Delete the previous articles index in Elasticsearch
Tag.__elasticsearch__.client.indices.delete index: Tag.index_name rescue nil

# Create the new index with the new mapping
Tag.__elasticsearch__.client.indices.create \
  index: Tag.index_name,
  body: { settings: Technology.settings.to_hash, mappings: Tag.mappings.to_hash }

# Index all article records from the DB to Elasticsearch
Tag.import
