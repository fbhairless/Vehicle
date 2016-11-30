require('sinatra')
require('sinatra/reloader')
require('./lib/vehicle.rb')
also_reload('./**/*.rb')
require('pry')

get('/') do
  erb(:index)
end

get('/vehicles') do
  @vehicles = Vehicle.all()
  erb(:vehicles)
end

get("/vehicles/new") do
  erb(:vehicles_form)
end

post("/vehicles") do
  make = params.fetch("make")
  model = params.fetch("model")
  year = params.fetch("year")
  vehicle = Vehicle.new(make, model, year)
  vehicle.save
  erb(:success)
end

get("/vehicles/:id") do
  @vehicle = Vehicle.find(params.fetch("id"))
  erb(:vehicle)
end
