require 'spec_helper'
require 'schema_dot_org/schema'

RSpec.describe SchemaDotOrg::Schema do
  let(:schema) { described_class.new(node) }
  context 'when single node' do
    let(:node) { double('Anything', to_json_struct: {'@type' => 'Anything', 'address' => "Las Vegas, NV"}) }

    describe "#to_json" do
      it "generates the expected string" do
        expect(schema.to_json).to eq '{"@context":"http://schema.org","@type":"Anything","address":"Las Vegas, NV"}'
      end
    end

    describe "#to_json_ld" do
      it "generates the expected string" do
        expect(schema.to_json_ld).to eq "<script type=\"application/ld+json\">\n{\"@context\":\"http://schema.org\",\"@type\":\"Anything\",\"address\":\"Las Vegas, NV\"}\n</script>"
      end
    end

    describe "#to_s" do
      it "generates the same string as #to_json_ld(pretty: true)" do
        expect(schema.to_s).to eq "<script type=\"application/ld+json\">\n{\n  \"@context\": \"http://schema.org\",\n  \"@type\": \"Anything\",\n  \"address\": \"Las Vegas, NV\"\n}\n</script>"
      end
    end
  end

  context 'when array of nodes' do
    let(:node) { [double('Anything', to_json_struct: {'@type' => 'Anything', 'address' => "Las Vegas, NV"}),
                  double('Anything', to_json_struct: {'@type' => 'Anything2', 'address' => "second address"})] }

    describe "#to_json" do
      it "generates the expected string" do
        expect(schema.to_json).to eq '{"@context":"http://schema.org","@graph":[{"@type":"Anything","address":"Las Vegas, NV"},{"@type":"Anything2","address":"second address"}]}'
      end
    end
  end
end