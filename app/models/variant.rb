class Variant < ApplicationRecord
  belongs_to :product

  validates :waist,
            numericality: { only_integer: true,
                            greater_than_or_equal_to: 0 }

  validates :length,
            numericality: { only_integer: true,
                            greater_than_or_equal_to: 0 }

  validates :count,
            numericality: { only_integer: true,
                            greater_than_or_equal_to: 0 }
end
