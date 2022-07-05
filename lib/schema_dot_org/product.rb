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
                  :additional_property,
                  :category,
                  :color,
                  :material,
                  :productID,
                  :gtin,
                  :sku,
                  :height,
                  :width,
                  :depth,
                  :size,
                  :keywords

    validates :category,                    allow_nil: true
    validates :color,                       allow_nil: true
    validates :material,                    allow_nil: true
    validates :productID,                   allow_nil: false
    validates :gtin,                        allow_nil: true
    validates :sku,                         allow_nil: true
    validates :height,                      type: SchemaDotOrg::QuantitativeValue, allow_nil: true
    validates :width,                       type: SchemaDotOrg::QuantitativeValue, allow_nil: true
    validates :depth,                       type: SchemaDotOrg::QuantitativeValue, allow_nil: true
    validates :size,                        type: SchemaDotOrg::SizeSpecification, allow_nil: true
    validates :keywords,                    allow_nil: true
    validates :offers,                      type: SchemaDotOrg::Offer, allow_nil: true
    validates :aggregate_rating,            type: SchemaDotOrg::AggregateRating, allow_nil: true
    validates :brand,                       type: SchemaDotOrg::Thing, allow_nil: true
    validates :review,                      type: Array, allow_nil: true
    validates :additional_property,         type: Array, allow_nil: true

    def _to_json_struct
      super.merge({
          "productID" => productID,
          "gtin" => gtin,
          "sku" => sku,
          "category" => category,
          "brand" => brand&.to_json_struct,
          "color" => color,
          "material" => material,
          "height" => height&.to_json_struct,
          "width" => width&.to_json_struct,
          "depth" => depth&.to_json_struct,
          "size" => size&.to_json_struct,
          "aggregateRating" => aggregate_rating&.to_json_struct,
          "offers" => offers&.to_json_struct,
          "review" => review&.map(&:to_json_struct),
          "additionalProperty" => additional_property&.map(&:to_json_struct)
      })
    end
  end
end
