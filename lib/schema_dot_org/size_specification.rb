# frozen_string_literal: true

require 'schema_dot_org'

module SchemaDotOrg
  class SizeSpecification < Thing
    attr_accessor :suggested_gender

    # validates :suggested_gender, type: String, inclusion: GenderType.values

    def _to_json_struct
      super.merge({
                    'suggestedGender' => suggested_gender
                  })
    end
  end
end
