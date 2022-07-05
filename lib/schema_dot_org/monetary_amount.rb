# frozen_string_literal: true

require 'schema_dot_org'

module SchemaDotOrg
  class MonetaryAmount < Thing
    attr_accessor :value, :currency

    validates :value,           type: Numeric, allow_nil: false
    validates :currency,        type: String, allow_blank: false

    def _to_json_struct
      super.merge({
                    'value' => value,
                    'priceCurrency' => currency
                  })
    end
  end
end