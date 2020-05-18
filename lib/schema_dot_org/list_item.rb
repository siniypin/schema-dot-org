# frozen_string_literal: true

require 'schema_dot_org'
require 'schema_dot_org/thing'


module SchemaDotOrg
  # Model the Schema.org `ItemListElement`.  See https://schema.org/ItemListElement
  class ListItem < Thing
    attr_accessor :position, :item

    validates :position,      type: Integer, presence: true

    validates :item,         type: Thing, allow_nil: true

    def _to_json_struct
      super.merge({
          'position' => position,
          'item' => object_to_json_struct(item)
      })
    end
  end
end
