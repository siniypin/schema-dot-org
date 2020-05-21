# frozen_string_literal: true

require 'date'
require 'schema_dot_org'

# Model the Schema.org `Thing > Product`.  See https://schema.org/Product
#
module SchemaDotOrg
  class Product < Thing
    attr_accessor :aggregate_rating,
                  :offers,
                  :brand,
                  :review,
                  :additional_property

    validates :offers,                      type: SchemaDotOrg::AggregateOffer, allow_nil: true
    validates :aggregate_rating,            type: SchemaDotOrg::AggregateRating, allow_nil: true
    validates :brand,                       type: SchemaDotOrg::Thing, allow_nil: true
    validates :review,                      type: Array, allow_nil: true
    validates :additional_property,         type: Array, allow_nil: true

    def _to_json_struct
      super.merge({
          "aggregateRating" => aggregate_rating&.to_json_struct,
          "offers" => offers&.to_json_struct,
          "brand" => brand&.to_json_struct,
          "review" => review&.map(&:to_json_struct),
          "additionalProperty" => additional_property&.map(&:to_json_struct)
      })
    end
  end
end
