# frozen_string_literal: true

require 'schema_dot_org'

module SchemaDotOrg
  class OfferShippingDetails < Thing
    attr_accessor :shipping_destination, :shipping_rate

    # validates :shipping_destination, type: DefinedRegion, allow_nil: false
    # validates :shipping_rate, type: MonetaryAmount, allow_nil: true

    def _to_json_struct
      super.merge({
                    'shippingDestination' => shipping_destination.to_json_struct,
                    'shippingRate' => shipping_rate&.to_json_struct
                  })
    end
  end
end