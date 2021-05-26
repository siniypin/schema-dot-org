require 'schema_dot_org'

# Model the Schema.org `Thing > EntryPoint`.  See https://schema.org/EntryPoint
#
module SchemaDotOrg
  class EntryPoint < Thing
    attr_accessor :urlTemplate

    validates :urlTemplate, type: String, presence: true

    def _to_json_struct
      super.merge({
                    'urlTemplate' => self.urlTemplate
                  })
    end
  end
end