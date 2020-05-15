# frozen_string_literal: true

require 'open-uri'
require 'faker'

10.times do
  rental = Rental.create(
    title: "#{Faker::Appliance.brand} #{Faker::Appliance.equipment}",
    owner: Faker::Name.name,
    city: Faker::Address.city,
    category: Rental::CATEGORIES.sample,
    bedrooms: (1..5).to_a.sample,
    description: Faker::Hipster.sentence
  )

  image_url = "https://http.cat/#{Rack::Utils::HTTP_STATUS_CODES.keys.sample}.jpg"
  filename = File.basename(URI.parse(image_url).path)
  begin
    image = URI.open(image_url)
    rental.image.attach io: image, filename: filename
  rescue OpenURI::HTTPError
    puts "Rental with id #{rental.id} does not have an image"
  end
end
