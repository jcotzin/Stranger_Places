var renderTemplate = function(template, res){
  var results = document.createElement('div');
  results.innerHTML = Mustache.render(template, res);
  return results;
};


function ready() {
  /* search widget */
  var search = instantsearch({
    appId: '12KP1BHKKE',
    apiKey: '58f099d735a609f4f293f60090637b9d', // Special API key generated to allow browsing
    indexName: 'Place',
    searchParameters: {
      attributesToSnippet: 'name:9'
    },
    urlSync: {
      useHash: true
    }
  });

  var searchBoxWidget = instantsearch.widgets.searchBox({
    container: '#search-input'
  });
  /* end */

  /* infinite scroll widget */
  var initialRender = function(container, args, templates, parent){
    if(args.results.nbHits) {
      args.results.pageNo = page + 1;
      var results = renderTemplate(templates.items, args.results);
    } else {
      var results = renderTemplate(templates.empty, args.results);
      results.querySelector('.clear-all').addEventListener('click', function(e){
        e.preventDefault();
        helper.clearRefinements().setQuery('').search();
      });
    }

    container.innerHTML = '';
    container.appendChild(results);
  };

  var cursor, index, page, nbPages, loading;

  var hitsDiv = document.getElementById('hits');

  var infiniteScrollWidget = function(options){
    var container = document.querySelector(options.container);
    var templates = options.templates;
    var offset = parseInt(options.offset, 10);

    if(!container) {
      throw new Error('infiniteScroll: cannot select \'' + options.container + '\'');
    }

    return {
      init: function(){},
      render: function (args) {
        helper = args.helper;
        page = args.state.page;
        nbPages = args.results.nbPages;

        var scope = {
          templates: templates,
          container: container,
          args: args,
          offset: offset
        };

        if (args.results.nbHits) {
          window.addEventListener('scroll', searchNewRecords.bind(scope));
        }

        initialRender(container, args, templates);
    }
    }
  };

  var infiniteScrollWidget = infiniteScrollWidget({
    container: '#hits',
    templates: {
      items: document.querySelector('#hits-template').innerHTML,
      empty: document.querySelector('#no-results-template').innerHTML
    }
  });
  /* end */

  /* infinite scrolling events */
  var scrolledNearBottom = function(el){
    return (el.scrollHeight - el.scrollTop) < 850;
  };

  var searchNewRecords = function(){
    if(scrolledNearBottom(document.querySelector('body'))) {
      addSearchedRecords.call(this);
    }
  };

  var addSearchedRecords = function(){
    if(!loading && page < nbPages - 1) {
      loading = true;
      page += 1;
      helper.searchOnce({page: page}, appendSearchResults.bind(this));
    }
  };

  var appendSearchResults = function(err, res, state){
    page = res.page;
    res.pageNo = page + 1;
    loading = false;

    var result = renderTemplate(this.templates.items, res);
    this.container.appendChild(result);

    if(page === nbPages - 1 && (this.args.results.nbHits > nbPages * this.args.results.hitsPerPage)){
      index = helper.client.initIndex(this.args.state.index);
      window.removeEventListener('scroll', searchNewRecords.bind(this));
      window.addEventListener('scroll', browseNewRecords.bind(this));
      addBrowsedRecords.call(this);
    }
  };
  /* end */

  search.addWidget(searchBoxWidget);
  search.addWidget(infiniteScrollWidget);
  search.start();

  // added video hide and hits show not part of aloglia...

  $("#hits").hide();
  $("#search-input").click(function(){
    // on clicking the searhc bar hide video
    $("#hits").show();
  });
}

$(document).on('ready turbolinks:load', ready);
