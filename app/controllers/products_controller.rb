class ProductsController < ApplicationController
  def index
    render json: Product.all, except: [:created_at, :updated_at]
  end
end
