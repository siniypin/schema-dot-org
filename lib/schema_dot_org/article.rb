# frozen_string_literal: true

require 'schema_dot_org'

# Model the Schema.org `CreativeWork > Article`.  See https://schema.org/Article
#
module SchemaDotOrg
  class Article < CreativeWork
    attr_accessor :article_section

    def _to_json_struct
      super.merge({
                    "articleSection" => self.article_section
                  })
    end
  end
end
