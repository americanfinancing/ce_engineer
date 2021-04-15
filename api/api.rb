require 'sinatra'
require 'sinatra/json'
require 'sinatra/reloader' # always development

get '/' do
  'This is a simple simulated API endpoint to serve JSON data'
end

get '/api/restaurants' do
  per_page = params.fetch(:per_page, 25).to_i
  page = params.fetch(:page, 1).to_i
  restaurants = JSON.parse(File.read('restaurants.json'))

  scoped = if ((page - 1) * per_page < restaurants.size && per_page < restaurants.size)
             restaurants.slice((page - 1) * per_page, per_page)
           else
             restaurants
           end

  json restaurants: scoped, total_entries: restaurants.size, per_page: per_page
end
