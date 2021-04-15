#!/usr/bin/env ruby

require 'faker'

class RestaurantGenerator
  def generate
    restaurants = []
    200.times do
      restaurants.push({
        name: Faker::Restaurant.name,
        address: Faker::Address.street_address,
        city: 'Denver',
        state: 'Colorado',
        postal_code: '802' + rand(99).to_s.rjust(2, '0'),
        phone: '555' + rand(9999999).to_s.rjust(7, '0'),
        price: rand(5),
        reserve_url: '#?reserve_url=true',
        image_url: 'https://picsum.photos/195?grayscale&blur=2'
      })
    end

    File.truncate('restaurants.json', 0)
    File.write('restaurants.json', restaurants.to_json)
  end
end

RestaurantGenerator.new.generate
