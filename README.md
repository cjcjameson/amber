Amber
=====

[amber-brew.herokuapp.com](http://amber-brew.herokuapp.com) -- Site live, but under construction.

Beer pairings for the aficionado

##How to use the code

###Setting up your database and rails files

First, ensure that you have the database.yml file in your config directory. Then:

 - You'll need your own yelp api keys and tokens for the api to work!  Create: config/config.yml with the following content:

 		Example:

 		development:
		   yelp:
		      consumer_key: 'secret'
		      consumer_secret: 'secret'
		      token: 'secret'
		      token_secret: 'secret'

		production:
		   yelp:
		      consumer_key: 'secret'
		      consumer_secret: 'secret'
		      token: 'secret'
		      token_secret: 'secret'

		test:
		      consumer_key: 'secret'
		      consumer_secret: 'secret'
		      token: 'secret'
		      token_secret: 'secret'

 - Bundle
 - Run "rake db:create"
 - Run "rake db:migrate", and if you want, "rake db:seed"
   + Our seed files have two different versions. The current seed file pulls information from BreweryDB and requires an API key. Please contact the team for more information

 - The following is an example of how config/database.yml should look

		development:
		  adapter: postgresql
		  encoding: unicode
		  database: amber_development
		  pool: 5
		  username:
		  password:

		test:
		  adapter: postgresql
		  encoding: unicode
		  database: amber_test
		  pool: 5
		  username:
		  password:

		production:
		  adapter: postgresql
		  encoding: unicode
		  database: amber_production
		  pool: 5
		  username:
		  password:

 - Run "rails server"
 - Check at "localhost:3000"


...and you should be good to go!

###Seed File
 - The seed file included in this version includes data on beer genres, food flavors and corresponding matches. At present, we do not include a limited list of sample beers in this repo but can provide that on request.
 - The deployed app references a full list of beers through the BreweryDB API
 - The deployed app is backed by an Amazon Web Services Relational Database

##[Team Workflow](/workflow.md)


##Team Members
 - [Allison Wong](https://github.com/azywong)
 - [C.J. Jameson](https://github.com/cjcjameson)
 - [Devin Johnson](https://github.com/djohnson0610) (team lead)
 - [Yuzu Saijo](https://github.com/rubberyuzu)

##Contributing
At the present time, we are not accepting outside contributions.

##Presenting
Come see us present on Friday, June 11, 10:00 AM.

Dev Bootcamp

633 Folsom St.

San Francisco CA

6th Floor
