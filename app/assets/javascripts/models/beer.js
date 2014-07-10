function Beer(beerJson){
	this.name = beerJson.name;
	this.description = beerJson.description;
	this.abv = beerJson.abv;
	this.style= beerJson.style;
	this.label_url = beerJson.label_url || '/../../amberlabel.png';
}