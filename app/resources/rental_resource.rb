# frozen_string_literal: true

class RentalResource < JSONAPI::Resource
  attributes :title, :city, :owner, :category, :bedrooms, :description, :image_url

  def image_url
    return unless @model.image.attached?

    Rails.application.routes.url_helpers.rails_blob_path(@model.image, only_path: true)
  end
end
