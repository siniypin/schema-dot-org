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

    # validates :category,                    type: String, allow_nil: true
    # validates :color,                       type: String, allow_nil: true
    # validates :material,                    type: String, allow_nil: true
    # validates :productID,                   type: String, allow_nil: false
    # validates :gtin,                        type: String, allow_nil: true
    # validates :sku,                         type: String, allow_nil: true
    # validates :height,                      type: QuantitativeValue, allow_nil: true
    # validates :width,                       type: QuantitativeValue, allow_nil: true
    # validates :depth,                       type: QuantitativeValue, allow_nil: true
    # validates :size,                        type: SizeSpecification, allow_nil: true
    # validates :keywords,                    type: String, allow_nil: true
    # validates :offers,                      type: Offer, allow_nil: true
    # validates :aggregate_rating,            type: AggregateRating, allow_nil: true
    # validates :brand,                       type: Brand, allow_nil: true

    def _to_json_struct
      super.merge({
                    'productID' => productID,
                    'gtin' => gtin,
                    'sku' => sku,
                    'category' => category,
                    'brand' => brand&.to_json_struct,
                    'color' => color,
                    'material' => material,
                    'height' => height&.to_json_struct,
                    'width' => width&.to_json_struct,
                    'depth' => depth&.to_json_struct,
                    'size' => size&.to_json_struct,
                    'aggregateRating' => aggregate_rating&.to_json_struct,
                    'keywords' => keywords,
                    'offers' => offers&.to_json_struct
      })
    end
  end
end
