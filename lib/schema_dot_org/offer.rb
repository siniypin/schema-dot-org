# frozen_string_literal: true

require 'schema_dot_org'

# Model the Schema.org `Thing > Offer`.  See https://schema.org/Offer
#
module SchemaDotOrg
  class Offer < Thing
    attr_accessor :price_currency,
                  :price,
                  :availability,
                  :seller,
                  :gtin,
                  :sku,
                  :category,
                  :shipping_details,
                  :inventory_level

    validates :price_currency,        type: String
    validates :price,                 type: Numeric, allow_nil: true
    validates :availability,          type: String, allow_nil: true, inclusion: Availability.values
    validates :seller,                type: Organization, allow_nil: true
    validates :gtin,                  type: String, allow_nil: true
    validates :sku,                   type: String, allow_nil: true
    validates :category,              type: String, allow_blank: true
    validates :shipping_details,      type: OfferShippingDetails, allow_nil: true
    validates :inventory_level,       type: QuantitativeValue, allow_nil: true

    def _to_json_struct
      super.merge({
                    'gtin' => gtin,
                    'sku' => sku,
                    'price' => price,
                    'priceCurrency' => price_currency,
                    'availability' => availability,
                    'shippingDetails' => shipping_details&.to_json_struct,
                    'inventoryLevel' => inventory_level&.to_json_struct,
                    'seller' => seller&.to_json_struct
      })
    end
  end
end
