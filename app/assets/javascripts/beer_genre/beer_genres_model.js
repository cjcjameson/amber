function BeerGenre(genre_id){
	this.genre_id = genre_id
	this.dom = $('#'+genre_id).clone()
}