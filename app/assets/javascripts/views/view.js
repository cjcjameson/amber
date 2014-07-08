function View(){
};

View.prototype = {
	empty: function(target){
		target.empty()
	},
	draw: function(target, content){
		target.append(content)
	}
}