# frozen_string_literal: true

class RentalsController < JSONAPI::ResourceController
  include JSONAPI::Utils

  def index
    @rentals = Rental.includes(image_attachment: :blob).all
    if params[:city]
      @rentals = @rentals.where('city LIKE ?', "%#{params[:city]}%")
    end
    jsonapi_render json: @rentals
  end
end
