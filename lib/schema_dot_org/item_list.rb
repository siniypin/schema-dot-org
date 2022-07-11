# frozen_string_literal: true

require 'schema_dot_org'

module SchemaDotOrg
  # Model the Schema.org `ItemList`.  See https://schema.org/ItemList
  class ItemList < Thing
    attr_accessor :itemListOrder,
                  :numberOfItems,
                  :item_list_element

    # validates :itemListOrder,     type: String,   allow_nil: true
    # validates :numberOfItems,     type: Integer,  allow_nil: true
    # validates :item_list_element,   type: Array,    presence: true


    def _to_json_struct
      super.merge({
          'itemListOrder' => itemListOrder,
          'numberOfItems' => numberOfItems,
          'url' => url,
          'image' => image,
          'itemListElement' => item_list_element.map(&:to_json_struct)
      })
    end

    def item_list_element
      @item_list_element || []
    end
  end
end