# frozen_string_literal: true

require 'schema_dot_org'

# Model the Schema.org `Thing > Rating`.  See https://schema.org/Rating
#
module SchemaDotOrg
  class AggregateRating < Rating
    attr_accessor :review_count

    validates :review_count,            type: Integer

    def _to_json_struct
      super.merge({
                      "reviewCount" => review_count
                  })
    end

  end
end
