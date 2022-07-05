# frozen_string_literal: true

require 'date'
require 'schema_dot_org'
require 'schema_dot_org/offer'

# Model the Schema.org `Thing > Offer > AggregateOffer`.  See https://schema.org/AggregateOffer
#
module SchemaDotOrg
  class AggregateOffer < Offer
    attr_accessor :high_price,
                  :low_price,
                  :offer_count,
                  :offers

    validates :low_price,       type: Numeric, allow_nil: true
    validates :high_price,      type: Numeric, allow_nil: true
    validates :offer_count,     type: Integer, allow_nil: true
    validates :offers,          type: Array, allow_nil: true

    def _to_json_struct
      super.merge({
                    'lowPrice' => low_price,
                    'highPrice' => high_price,
                    'offerCount' => offer_count,
                    'offers' => offers&.map(&:to_json_struct)
      })
    end


  end
end
