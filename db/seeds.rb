# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


for i in 1..5
  result = HTTParty.get("http://api.brewerydb.com/v2/beers/?key=ecca795782bac08b48d8d9aac51602c8&p#{i}&status=verified&format=json")
  parsed_results = JSON.parse(result.to_json)["data"]
  parsed_results.map { |result| Beer.create(name: result["name"], description: result["description"], abv: result["abv"], isOrganic: result["isOrganic"], status: result["status"], available: result["available"]["name"], category: result["style"]["category"]["name"]), style: result["style"]["name"] }
end