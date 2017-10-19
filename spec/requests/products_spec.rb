require 'rails_helper'

RSpec.describe 'Products API', type: :request do
  let!(:products) { create_list(:product, 3) }

  describe 'GET /products' do
    before { get '/products' }

    it 'returns HTTP status 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns all the products' do
      expect(json.size).to eq(3)
    end
  end

  private

  def json
    JSON.parse(response.body)
  end
end
