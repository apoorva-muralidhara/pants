class ProductSerializer < ActiveModel::Serializer
  attributes :name, :description, :image
  has_many :variants
end
