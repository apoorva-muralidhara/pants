class ProductSerializer < ActiveModel::Serializer
  attributes :name, :description, :image
end
