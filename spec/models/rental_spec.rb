# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Rental, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:owner) }
    it { should validate_presence_of(:category) }
    it { should validate_inclusion_of(:category).in_array(Rental::CATEGORIES) }
    it { should validate_numericality_of(:bedrooms).is_greater_than_or_equal_to(0) }
  end
end
