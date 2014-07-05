Amber.Beer = DS.Model.extend({
  resourceUrl:'/beers',
  name: DS.attr('string'),
  description: DS.attr('string'),
  abv: DS.attr('string'),
  isOrganic: DS.attr('string'),
  status: DS.attr('string'),
  available: DS.attr('string'),
  category: DS.attr('string'),
  style: DS.attr('string'),
  icon_url: DS.attr('string')
});