# frozen_string_literal: true

class RentalResource < JSONAPI::Resource
  attributes :title, :city, :owner, :category, :bedrooms, :description, :image

  def image
    return unless @model.image.attached?

    "http://localhost:3000#{Rails.application.routes.url_helpers.rails_blob_path(@model.image, only_path: true)}"
  end
end
