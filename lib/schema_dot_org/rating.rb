# frozen_string_literal: true

require 'schema_dot_org'

# Model the Schema.org `Thing > Rating`.  See https://schema.org/Rating
#
module SchemaDotOrg
  class Rating < Thing
    attr_accessor :rating_value,:best_rating,:worst_rating

    # validates :rating_value,            type: Numeric
    # validates :best_rating,             type: Numeric, allow_nil: true
    # validates :worst_rating,            type: Numeric, allow_nil: true

    def _to_json_struct
      super.merge({
                    'ratingValue' => rating_value,
                    'bestRating' => best_rating,
                    'worstRating' => worst_rating
                  })
    end

  end
end
