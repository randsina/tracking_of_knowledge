class Technology < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :themes, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  acts_as_taggable
  include Searchable
end

# Delete the previous articles index in Elasticsearch
Technology.__elasticsearch__.client.indices.delete index: Technology.index_name rescue nil

# Create the new index with the new mapping
Technology.__elasticsearch__.client.indices.create \
  index: Technology.index_name,
  body: { settings: Technology.settings.to_hash, mappings: Technology.mappings.to_hash }

# Index all article records from the DB to Elasticsearch
Technology.import
