# frozen_string_literal: true

require 'schema_dot_org'

# Model the Schema.org `Thing > Question`.  See https://schema.org/Question
#
module SchemaDotOrg
  class Question < Thing
    attr_accessor :acceptedAnswer, :name

    def _to_json_struct
      super.merge({
                    "name" => self.name,
                    "acceptedAnswer" => self.acceptedAnswer.to_json_struct
                  })
    end
  end
end
