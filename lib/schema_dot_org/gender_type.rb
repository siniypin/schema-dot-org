# frozen_string_literal: true

require 'schema_dot_org'

module SchemaDotOrg
  module GenderType
    FEMALE = 'female'
    MALE = 'male'

    def values
      [FEMALE, MALE]
    end

    module_function :values
  end
end