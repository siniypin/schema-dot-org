# frozen_string_literal: true

require 'schema_dot_org'

# Model the Schema.org `Thing > CreativeWork > WebPage`.  See https://schema.org/FAQPage
#
module SchemaDotOrg
  class FAQPage < WebPage
    attr_accessor :item_list_element

    def _to_json_struct
      super.merge({
                    "mainEntity" => item_list_element.map(&:to_json_struct)
                  })
    end

    def item_list_element
      @item_list_element || []
    end
  end
end
