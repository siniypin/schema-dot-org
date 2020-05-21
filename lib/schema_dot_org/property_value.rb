# frozen_string_literal: true

require 'date'
require 'schema_dot_org'

# Model the Schema.org `Thing > PropertyValue`.  See https://schema.org/PropertyValue
#
module SchemaDotOrg
  class PropertyValue < StructuredValue
    attr_accessor :value

    validates :value,                 type: String, allow_nil: true

    def _to_json_struct
      super.merge({
                      "value" => value
                  })
    end
  end
end