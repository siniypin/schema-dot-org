# frozen_string_literal: true

require 'schema_dot_org'

module SchemaDotOrg
  # Model the Schema.org `Thing`.  See https://schema.org/Thing
  class Thing < SchemaType
    attr_accessor :id, :url, :name, :image

    validates :id, type: String, allow_nil: true
    validates :url, type: String, allow_nil: true
    validates :name, type: String, allow_nil: true
    validates :image, type: String, allow_nil: true

    def _to_json_struct
      {
          '@id' => id,
          'url' => url,
          'name' => name,
          'image' => image,
      }
    end
  end
end
