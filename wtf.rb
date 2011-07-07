require 'rubygems'
require 'json'
require 'nestful' # http://bit.ly/ohRJDz
require 'awesome_print'

base = "http://api.twitter.com/1/statuses/user_timeline.json?screen_name=gilesgoatboy"

tweets = JSON.parse(Nestful.get(base, :params => {:max_id => "88427433824489472"}))

ap tweets.collect {|tweet| [tweet["id"], tweet["text"]]}

