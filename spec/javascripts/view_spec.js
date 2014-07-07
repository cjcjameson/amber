describe("homepage", function() {
	it("contains a test with an expectation", function() {
		expect(true).toBe(true);
	});
});

describe("suite wide mocking ajax", function() {

  describe("homepage", function() {

    beforeEach(function() {
      jasmine.Ajax.install();
    });

    afterEach(function() {
      jasmine.Ajax.uninstall();
    });

    it("displays an okay response for getBeers", function(){
      var doneFn = jasmine.createSpy("success");
      var xhr = new XMLHttpRequest();
      xhr.onreadystatechange = function(args) {
        if (this.readyState == this.DONE) {
          doneFn(this.responseText);
        }
      };
      xhr.open("GET", "beers/search");
      xhr.send();

      expect(jasmine.Ajax.requests.mostRecent().url).toBe("beers/search");
      expect(doneFn).not.toHaveBeenCalled();
      jasmine.Ajax.requests.mostRecent().response({
        "status": 200,
        "contentType": 'json',
        "responseText": 'whatever'
      })
    });
  });
});