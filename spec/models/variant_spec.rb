require 'rails_helper'

RSpec.describe Variant, type: :model do
  it { is_expected.to belong_to :product }

  specify do
    is_expected.to validate_numericality_of(:waist)
                    .only_integer.is_greater_than_or_equal_to(0)
  end

  specify do
    is_expected.to validate_numericality_of(:length)
                    .only_integer.is_greater_than_or_equal_to(0)
  end


  specify do
    is_expected.to validate_numericality_of(:count)
                    .only_integer.is_greater_than_or_equal_to(0)
  end

end
