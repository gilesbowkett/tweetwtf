require 'rubygems'
require 'json'
require 'nestful' # http://bit.ly/ohRJDz
require 'awesome_print'

base = "http://api.twitter.com/1/statuses/user_timeline.json?screen_name=gilesgoatboy"

tweets = JSON.parse(Nestful.get(base, :params => {:max_id => "88427433824489472"}))

ap tweets.collect {|tweet| [tweet["id"], tweet["text"]]}

# TODO: the actual goal of this code is to get all of my tweets since the beginning of
# (Twitter) time. in actuality this is constrained by how far back Twitter is willing
# to go; the docs indicate (http://bit.ly/pv3wwZ) that Twitter may reserve the right to
# just not return data at some unspecified point.

# anyway, the way to make this return a gazillion tweets until Twitter loses patience is
# something like this:

# gazillion.times do
#   tweets = JSON.parse(Nestful.get(base, :params => {:max_id => last_max_id}))
#   last_max_id = tweets.last["id"]
# end

