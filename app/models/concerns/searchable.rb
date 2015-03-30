require 'elasticsearch/model'

module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    def self.search(query)
      __elasticsearch__.search(
        {
          query: {
            wildcard: {
              name: {
                value: "*#{query}*"
              }
            }
          },
          highlight: {
            pre_tags: ['<em>'],
            post_tags: ['</em>'],
            fields: {
              name: {},
            }
          }
        }
      )
    end

    settings index: { number_of_shards: 1 } do
      mappings dynamic: 'false' do
        indexes :name, analyzer: 'english', index_options: 'offsets'
      end
    end
  end
end
