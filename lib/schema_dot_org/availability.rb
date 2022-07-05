# frozen_string_literal: true

require 'schema_dot_org'

module SchemaDotOrg
  module Availability
    IN_STOCK = 'https://schema.org/InStock'
    OUT_OF_STOCK = 'https://schema.org/OutOfStock'

    def values
      [IN_STOCK, OUT_OF_STOCK]
    end

    module_function :values
  end
end