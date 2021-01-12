# frozen_string_literal: true

require 'schema_dot_org'

# Model the Schema.org `Thing > Answer`.  See https://schema.org/Answer
#
module SchemaDotOrg
  class Answer < Thing
    attr_accessor :text

    def _to_json_struct
      super.merge({
                    "text" => self.text
                  })
    end
  end
end
