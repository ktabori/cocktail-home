express   = require 'express'
unirest   = require 'unirest'
router    = express.Router()

nav           = 'https://api.airtable.com/v0/appVv3qQJXVr4clNx/Top Navigation Items?limit=100&view=Cocktail Navigation'
#api           = 'http://dash.gooose.co/api/saved/ktabori-main'

module.exports = (app) ->
  app.use '/', router

  router.get '/', (req, res, next) ->

    unirest.get nav
      .headers ({'Authorization': 'Bearer keyji9aGN0OHwZzZc'})
      .end (navres) ->

        #unirest.get api
        #  .end (response) ->
            data = {} #response.body
            data.pageTitle = 'Home'
            data.navigation = navres.body.records
            #res.render 'index', data
            res.render 'soon', data
