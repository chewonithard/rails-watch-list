# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require 'json'

url = "https://api.themoviedb.org/3/movie/top_rated?api_key=4eb5d4ec06930b8f7ae05e34b041348b"

data = JSON.parse(URI.open(url).read)

data["results"].each do |movie|
  Movie.create(title: movie["original_title"], overview: movie["overview"], poster_url: movie["poster_path"], rating: movie["vote_average"].to_f)
end
