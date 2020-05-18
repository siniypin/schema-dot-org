require 'json'
require 'validated_object'

#
# Base class for schema types. Refactors out common code.
#
module SchemaDotOrg
  class Schema < ValidatedObject::Base
    ROOT_ATTR = {"@context" => "http://schema.org"}.freeze

    def initialize(node)
      @node = node
    end

    def to_s
      json_string = to_json_ld(pretty: (!rails_production? && !ENV['SCHEMA_DOT_ORG_MINIFIED_JSON']))

      # Mark as safe if we're in Rails
      if json_string.respond_to?(:html_safe)
        json_string.html_safe
      else
        json_string
      end
    end

    def to_json(pretty: false)
      if @node.is_a? Array
        structure = ROOT_ATTR.merge('@graph' => @node.map(&:to_json_struct))
      else
        structure = ROOT_ATTR.merge(@node.to_json_struct)
      end

      if pretty
        JSON.pretty_generate(structure)
      else
        structure.to_json
      end
    end

    def to_json_ld(pretty: false)
      "<script type=\"application/ld+json\">\n" + to_json(pretty: pretty) + "\n</script>"
    end

    private

    def rails_production?
      defined?(Rails) && Rails.env.production?
    end
  end
end