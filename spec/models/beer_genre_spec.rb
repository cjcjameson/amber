require 'spec_helper'

describe BeerGenre do

	it { should validate_presence_of(:name) }
	
end