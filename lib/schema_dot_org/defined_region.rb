# frozen_string_literal: true

require 'schema_dot_org'

module SchemaDotOrg
  class DefinedRegion < Thing
    attr_accessor :address_country

    validates :address_country, type: String, allow_blank: false

    def _to_json_struct
      super.merge({
                    'addressCountry' => address_country
                  })
    end
  end
end