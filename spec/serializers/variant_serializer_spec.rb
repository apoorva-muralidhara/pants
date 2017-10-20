require 'rails_helper'

RSpec.describe VariantSerializer do
  let(:variant) { create(:variant) }

  let(:expected_serializer_hash) do
    { waist: variant.waist,
      length: variant.length,
      style: variant.style,
      count: variant.count }
  end

  subject(:serializer_hash) do
    VariantSerializer.new(variant).serializable_hash
  end

  it 'includes the waist' do
    expect(serializer_hash).to eq(expected_serializer_hash)
  end
end
