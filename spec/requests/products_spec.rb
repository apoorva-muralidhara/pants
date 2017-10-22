require 'rails_helper'

RSpec.describe 'Products API', type: :request do
  let!(:products) { create_list(:product, 3) }
  let(:product) { products.first }
  let!(:variant) { create(:variant, product: product) }

  describe 'GET /products' do
    before { get '/products' }

    it 'returns HTTP status 200' do
      expect(response).to have_http_status(200)
    end

    describe 'data' do
      subject(:data) { json['data'] }

      it 'returns all the products' do
        expect(data.size).to eq(3)
      end

      it 'contains the product ids and types' do
        expect(data.first).to include('id' => product.id.to_s,
                                      'type' => 'products')
      end

      it 'contains the product attributes' do
        expect(data.first['attributes'])
          .to eq('name' => product.name,
                 'description' => product.description,
                 'image' => product.image)
      end

      it 'contains the associated variant ids and types' do
        expect(data.first.dig('relationships', 'variants', 'data'))
          .to eq([{ 'id' => variant.id.to_s, 'type' => 'variants' }])
      end
    end

    describe 'included' do
      subject(:included) { json['included'] }

      it 'returns the associated variants' do
        expect(included.size).to eq(1)
      end

      it 'contains the associated variant ids and types' do
        expect(included.first).to include('id' => variant.id.to_s,
                                          'type' => 'variants')
      end

      it 'contains the associated variant attributes' do
        expect(included.first['attributes'])
          .to eq('waist' => variant.waist,
                 'length' => variant.length,
                 'style' => variant.style,
                 'count' => variant.count)
      end
    end
  end

  private

  def json
    JSON.parse(response.body)
  end
end
