# frozen_string_literal: true

require 'schema_dot_org'

# Model the Schema.org `Thing > Organization`.  See https://schema.org/Organization
#
module SchemaDotOrg
  class Organization < Thing
    attr_accessor :logo

    def _to_json_struct
      output_logo = self.logo.is_a?(String) ? self.logo : self.logo&.to_json_struct
      super.merge({
                    "logo" => output_logo
                  })
    end
  end
end
