require_relative "pokemon"
require "rest-client"
require "json"
require 'pry'

# Covering this because we need data to create our CLI
# API
# Scrape a page to get that info


# API -> Apllication Programming Interface
# Collection of data that someone put together and has allowed others to use!

# rest-clinet, httparty -> allow us to send http requests from ruby
# 

# send get request to pokemon api
resp = RestClient.get('https://pokeapi.co/api/v2/pokemon?offset=0&limit=151')
pokemon_hash = JSON.parse(resp.body, symbolize_names:true)
poke_arr = pokemon_hash[:results]


pokemon_instances = poke_arr.map do |pokemon_hash|
    Pokemon.new(pokemon_hash)
end


pokemon_instances.each do |pokemon_inst|
    resp = RestClient.get(pokemon_inst.url)
    pokemon_hash = JSON.parse(resp.body, symbolize_names:true)
    pokemon_inst.weight = pokemon_hash[:weight]
    pokemon_inst.height = pokemon_hash[:height]
    pokemon_inst.base_xp = pokemon_hash[:base_experience]
end


binding.pry