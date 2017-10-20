class ProductsController < ApplicationController
  def index
    render json: Product.all.includes(:variants)
  end
end
