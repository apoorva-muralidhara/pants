class ProductsController < ApplicationController
  def index
    render json: Product.includes(:variants), include: :variants
  end
end
