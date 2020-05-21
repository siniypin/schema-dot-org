# frozen_string_literal: true

require 'schema_dot_org'

# Model the Schema.org `Thing > Product > ProductModel`.  See https://schema.org/ProductModel
#
module SchemaDotOrg
  class ProductModel < Product
    attr_accessor :is_variant_of

    validates :is_variant_of,                 type: SchemaDotOrg::ProductModel, allow_nil: true

    def _to_json_struct
      super.merge({
                      "isVariantOf" => is_variant_of
                  })
    end
  end
end
