require 'rails_helper'

RSpec.describe ProductSerializer do
  let(:product) { create(:product) }
  let!(:variant) { create(:variant, product: product) }

  let(:expected_serializer_hash) do
    { name: product.name,
      description: product.description,
      image: product.image,
      variants: [expected_variant_serializer_hash]}
  end

  let(:expected_variant_serializer_hash) do
    { waist: variant.waist,
      length: variant.length,
      style: variant.style,
      count: variant.count }
  end

  subject(:serializer_hash) do
    ProductSerializer.new(product).serializable_hash
  end

  it 'includes the name, description, image, and variants' do
    expect(serializer_hash).to eq(expected_serializer_hash)
  end
end
