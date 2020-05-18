require 'json'
require 'validated_object'

#
# Base class for schema types. Refactors out common code.
#
module SchemaDotOrg
  class SchemaType < ValidatedObject::Base
    UNQUALIFIED_CLASS_NAME_REGEX = /([^:]+)$/

    # Use the class name to create the "@type" attribute.
    # @return a hash structure representing json.
    def to_json_struct
      {"@type" => un_namespaced_classname}.merge(_to_json_struct.compact)
    end


    def _to_json_struct
      raise "For subclasses to implement"
    end

    def object_to_json_struct(object)
      return nil unless object
      object.to_json_struct
    end


    # @return the classname without the module namespace.
    def un_namespaced_classname
      self.class.name =~ UNQUALIFIED_CLASS_NAME_REGEX
      Regexp.last_match(1)
    end

  end
end