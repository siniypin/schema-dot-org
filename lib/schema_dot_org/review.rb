# frozen_string_literal: true

require 'date'
require 'schema_dot_org'

# Model the Schema.org `Thing > Review`.  See https://schema.org/Review
#
module SchemaDotOrg
  class Review < CreativeWork
    attr_accessor :review_rating

    validates :review_rating,       type: SchemaDotOrg::Rating

    def _to_json_struct
      super.merge({
                      "reviewRating" => review_rating.to_json_struct
                  })
    end
  end
end
