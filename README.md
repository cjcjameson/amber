Amber
=====

amber-brew.herokuapp.com

Beer pairings for the aficionado

##How to use the code

###Setting up your database and rails files

First, ensure that you have the database.yml file in your config directory. Then:

 - Bundle
 - Run "rake db:create"
 - Run "rails server"
 - Check at "localhost:3000"

 		# PostgreSQL. Versions 8.2 and up are supported.

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

...and you should be good to go!

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