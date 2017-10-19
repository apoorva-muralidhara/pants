require 'rails_helper'

RSpec.describe ProductSerializer do
  let(:product) { create(:product) }

  subject(:serializer_hash) do
    ProductSerializer.new(product).serializable_hash
  end

  it 'includes the name, description, and image' do
    expect(serializer_hash)
      .to eq(name: product.name,
             description: product.description,
             image: product.image)
  end
end
