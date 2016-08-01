//not sure if this goes here. I created this file. Also check if app id and key works. Their values are set in config/initializers/algoriasearch.rb
var client = algoliasearch(application_id, api_key);
var index = client.initIndex('Place'); //indexname
index.search('something', { hitsPerPage: 10, page: 0 })
  .then(function searchDone(content) {
    console.log(content)
  })
  .catch(function searchFailure(err) {
    console.error(err);
  });
