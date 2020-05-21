# frozen_string_literal: true

require 'date'
require 'schema_dot_org'

# Model the Schema.org `Thing > CreativeWork`.  See https://schema.org/Offer
#
module SchemaDotOrg
  class CreativeWork < Thing
    attr_accessor :date_published, :author, :offers

    validates :date_published,         type: Date, allow_nil: true
    validates :author,                 type: Thing, allow_nil: true
    validates :offers,                      type: Array, allow_nil: true

    def _to_json_struct
      super.merge({
                      "offers" => offers&.map(&:to_json_struct),
                      "datePublished" => date_published&.iso8601,
                      "author" => author&.to_json_struct
                  })
    end
  end
end
