require 'rails_helper'

RSpec.describe ProductSerializer do
  let(:product) { create(:product) }

  subject(:serializer_hash) do
    ProductSerializer.new(product).serializable_hash
  end

  it 'includes the name' do
    expect(serializer_hash[:name]).to eq(product.name)
  end

  it 'includes the description' do
    expect(serializer_hash[:description]).to eq(product.description)
  end

  it 'includes the image' do
    expect(serializer_hash[:image]).to eq(product.image)
  end
end
