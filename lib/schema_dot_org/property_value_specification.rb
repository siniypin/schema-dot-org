require 'schema_dot_org'

# Model the Schema.org `Thing > PropertyValueSpecification`.  See https://schema.org/PropertyValueSpecification
#
module SchemaDotOrg
  class PropertyValueSpecification < Thing
    attr_accessor :valueName

    validates :valueName, type: String, presence: true

    def _to_json_struct
      super.merge({
                    'valueName' => self.valueName,
                    'valueRequired' => 'http://schema.org/True'
                    })
    end
  end
end