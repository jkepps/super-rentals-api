# frozen_string_literal: true

class Rental < ApplicationRecord
  CATEGORIES = %w[Condo Estate Apartment].freeze

  has_one_attached :image

  validates :title, presence: true
  validates :city, presence: true
  validates :owner, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :bedrooms, numericality: { greater_than_or_equal_to: 0 }
end
