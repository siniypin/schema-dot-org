# frozen_string_literal: true

require 'schema_dot_org'


module SchemaDotOrg
  # Model the Schema.org `Thing > SearchAction`.  See http://schema.org/SearchAction
  class SearchAction < SchemaType
    attr_accessor :target, :query_input

    # validates :target,      type: Hash, presence: true
    # validates :query_input, type: Hash, presence: true

    def _to_json_struct
      {
        'target' => self.target,
        'query-input' => self.query_input
      }
    end
  end
end
