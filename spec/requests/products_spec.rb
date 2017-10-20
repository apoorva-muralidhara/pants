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

    it 'returns all the products' do
      expect(json.size).to eq(3)
    end

    it 'contains the product ids and types' do
      expect(json.first).to include('id' => product.id.to_s,
                                    'type' => 'products')
    end

    it 'contains the product attributes' do
      expect(json.first['attributes'])
        .to eq('name' => product.name,
               'description' => product.description,
               'image' => product.image)
    end

    it 'contains the id and type of the associated variants' do
      expect(json.first.dig('relationships', 'variants', 'data'))
        .to eq([{ 'id' => variant.id.to_s, 'type' => 'variants' }])
    end
  end

  private

  def json
    JSON.parse(response.body)['data']
  end
end
