API Client for HotUKDeals (HUKD)
===================================

This client allows you to access all the documented API features from *HUKD REST API 2.0*
http://www.hotukdeals.com/rest-api/docs

Please note that the HUKD API Documentation is not entirely upto date (for example there is no longer a clothing category) and the deals return some additional fields such as mobile_deal_link which I've attempted to include.
You could say that the gem is actually more up to date than the API docs at the time of release :)

Prerequisites
-------------

	gem install hukd

YOU ARE NOW READY TO GET SOME SWEET DEAL DATA!

Usage
-----

You can start of by creating an instance of the client, which just needs an Api Key.

    require 'hukd'
    hukd	=	Hukd.new("YOUR_API_KEY_HERE")

You can then make an API request to receive an array of Deal objects.

	deals	=	hukd.hottest('deals')

The following API calls are available

	hottest(forum='', category='', limit=20, options={})
	newest(forum='', category='', limit=20, options={})
	discussed(forum='', category='', limit=20, options={})
	user(user='',forum='', category='', limit=20, options={})
	tag(tag='',forum='', category='', limit=20, options={})
	merchant(merchant='',forum='', category='', limit=20, options={})
	online(forum='', category='', limit=20, options={})
	offline(forum='', category='', limit=20, options={})
	search(keywords='',forum='', category='', online=false, page=1, limit=20, exclude_expired=0)

The options hash can contain all the keys available from
http://www.hotukdeals.com/rest-api/docs

Each deal object has the following attributes available:

	title
	deal_link
	mobile_deal_link
    deal_image
    description
    submit_time
    hot_time
    poster_name
    temperature
    price
    timestamp
    expired
    forum_name
    forum_url_name
    category_name
    category_url_name
    merchant_name
    merchant_url_name
    tags (a hash containing each tag as a string)
	deal_image_highres

Combining everything together will give you something like this:

    require 'hukd'
    hukd	=	Hukd.new("YOUR_API_KEY_HERE")
    deals	=	hukd.hottest('deals')
    deals.each |deal| do
    	puts(deal.title)
    end

This will fetch the hottest deals (default at 20) and print the title to the console.

Support
--------

Feel free to contact me or open an issue if need be.

PLEASE NOTE: You will need to add replace the "API_KEY_HERE" text with your key to make the tests pass.

Thanks
------

To the [great guide](https://github.com/radar/guides/blob/master/gem-development.md) by [Hrvoje Šimić](https://github.com/shime) to help me develop my first gem :)

To the [badfruit](https://github.com/brianmichel/BadFruit) gem by [brianmichel](https://github.com/brianmichel) which I referenced and to develop my own gem