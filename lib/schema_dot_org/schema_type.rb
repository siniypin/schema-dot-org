require 'json'
#
# Base class for schema types. Refactors out common code.
#
module SchemaDotOrg
  class SchemaType
    UNQUALIFIED_CLASS_NAME_REGEX = /([^:]+)$/

    def initialize(attributes = {})
      raise ArgumentError, "#{attributes} is not a Hash" unless attributes.is_a?(Hash)

      set_instance_variables from_hash: attributes
      return self
    end

    # Use the class name to create the "@type" attribute.
    # @return a hash structure representing json.
    def to_json_struct
      { '@type' => un_namespaced_classname }.merge(_to_json_struct.compact)
    end

    def _to_json_struct
      raise 'For subclasses to implement'
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

    private

    def set_instance_variables(from_hash:)
      from_hash.each do |variable_name, variable_value|
        # Test for the attribute reader
        self.send variable_name.to_sym

        # Set value in a way that succeeds even if attr is read-only
        self.instance_variable_set "@#{variable_name}".to_sym, variable_value
      end
    end
  end
end
