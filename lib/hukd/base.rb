module Hukd
	class Base
		attr_accessor :api_key
		API_VERSION = "2.0"
		API_BASE_URL = "http://api.hotukdeals.com/rest_api/v2/"

		def initialize(key)
			@api_key = key
		end

		def hottest(forum='', category='', limit=20, options={})
			options['order'] = 'hot'
			get(forum, category, limit, options)
		end

		def newest(forum='', category='', limit=20, options={})
			options['order'] = 'new'
			get(forum, category, limit, options)
		end

		def discussed(forum='', category='', limit=20, options={})
			options['order'] = 'discussed'
			get(forum, category, limit, options)
		end

		def user(user='',forum='', category='', limit=20, options={})
			if(options['order'].nil?)
				options['order'] = 'new'
			end
			options['username'] = user
			get(forum, category, limit, options)
		end

		def tag(tag='',forum='', category='', limit=20, options={})
			if(options['order'].nil?)
				options['order'] = 'new'
			end
			options['tag'] = tag
			get(forum, category, limit, options)
		end

		def merchant(merchant='',forum='', category='', limit=20, options={})
			if(options['order'].nil?)
				options['order'] = 'new'
			end
			options['merchant'] = merchant
			get(forum, category, limit, options)
		end

		def online(forum='', category='', limit=20, options={})
			if(options['order'].nil?)
				options['order'] = 'new'
			end
			options['online_offline'] = 'online'
			get(forum, category, limit, options)
		end

		def offline(forum='', category='', limit=20, options={})
			if(options['order'].nil?)
				options['order'] = 'new'
			end
			options['online_offline'] = 'offline'
			get(forum, category, limit, options)
		end

		def search(keywords='',forum='', category='', online=false, page=1, limit=20, exclude_expired=0)
			options = {}
			options['search'] = keywords
			options['page'] = page.to_int
			options['results_per_page'] = limit.to_int
			if(online!=false)
				options['online_offline'] = 'online'
			end

			if(exclude_expired!=0)
				options['exclude_expired']  = true
			end
			get(forum,category,limit,options)
		end

		def get(forum='', category='', limit=20, options={})
			# Set the API_KEY
			options['key'] = @api_key
			options['output'] = 'json'

			# Set the limit as long as it doesn't exceed the maximum allowed
			if(limit > 500)
				limit = 500
			end
			options['results_per_page'] = limit

			# Specify a forum
			if(forum != '')
				options['forum']  = forum
			end

			# Specify a category
			if(category != '')
				options['category'] = category
			end

			# Make a request
			resp  = HTTParty.get("#{API_BASE_URL}", :query => options)

			# Got a success response
			if resp.code == 200
				deals = MultiJson.load(resp.body)
				# Ensure a valid response is returned
				if (deals['error'])
					raise Exception, deals['error']
				end

				# Returned parsed deals
				return parse_deals(deals)
			end

		end

		def parse_deals(hash)
			dealsArray = Array.new
			hash["deals"]["items"].each do |deal|
				dealsArray.push(Deal.new(deal, self))
			end
			dealsArray
		end

	end
end