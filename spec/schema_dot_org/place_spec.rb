# frozen_string_literal: true

require 'spec_helper'
require 'schema_dot_org/place'


RSpec.describe SchemaDotOrg::Place do # rubocop:disable Metrics/BlockLength
  let(:home) { SchemaDotOrg::Place.new(address: 'Las Vegas, NV') }

  describe "#new" do
    it 'will not create a Place without an address' do
      expect { SchemaDotOrg::Place.new }.to raise_error(ArgumentError)
    end

    it 'creates a Place when given an address string' do
      expect { SchemaDotOrg::Place.new(address: 'NY, NY') }
    end

    it 'will not create a Place with an unknown attribute' do
      expect do
        Place.new(
          address: '12345 Happy Street',
          author:  'Hemmingway'
        )
      end.to raise_error(NoMethodError)
    end
  end

  describe "#to_json_struct" do
    it "has exactly the correct attributes and values" do
      expect(home.to_json_struct).to eq(
        '@type' => 'Place',
        'address' => 'Las Vegas, NV'
      )
    end
  end
end
