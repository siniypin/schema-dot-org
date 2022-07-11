# frozen_string_literal: true

require 'schema_dot_org'

module SchemaDotOrg
  class QuantitativeValue < Thing
    attr_accessor :value, :unit_code

    # validates :value,       type: Numeric, allow_nil: false
    # validates :unit_code,   type: String, allow_nil: true

    def _to_json_struct
      super.merge({
                    'value' => value,
                    'unitCode' => unit_code
                  })
    end
  end
end
