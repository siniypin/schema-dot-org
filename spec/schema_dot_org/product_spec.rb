# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'spec_helper'

RSpec.describe SchemaDotOrg::Product do
  describe "#new" do
    xit 'will not create with an unknown attribute' do
      expect do
        SchemaDotOrg::Product.new(
          snack_time:       'today',
          name:             'Public.Law',
          url:              'https://www.public.law'
        )
      end.to raise_error(NoMethodError)
    end


  end
end