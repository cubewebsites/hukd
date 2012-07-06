module Hukd
	class Deal

		attr_accessor  :title, :deal_link, :mobile_deal_link, :deal_image, :description, :submit_time, :hot_time, :poster_name,
		               :temperature, :temperature_rounded, :price, :timestamp, :expired,
		               :forum_name, :forum_url_name, :category_name, :category_url_name, :merchant_name, :merchant_url_name,
		               :tags, :deal_image_highres

	# @param [Hash] dealhash
	# @param [Hukd] hukd
		def initialize(dealhash,hukd)
			@title         = dealhash["title"]
			@deal_link     = dealhash["deal_link"]
			@mobile_deal_link = dealhash["mobile_deal_link"]
			@deal_image   = dealhash["deal_image"]
			@description   = dealhash["description"]
			@submit_time    = dealhash["submit_time"]
			@hot_time       =  dealhash["hot_time"]
			@poster_name    =  dealhash["poster_name"]
			@temperature    = dealhash["temperature"]
			@temperature_rounded  = temperature.to_int
			@price          = dealhash["price"]
			@timestamp      = dealhash["timestamp"]
			@expired        = dealhash["expired"]
			@forum_name     = dealhash["forum"]["name"]
			@forum_url_name = dealhash["forum"]["url_name"]
			@category_name  = dealhash["category"]["name"]
			@category_url_name  = dealhash["category"]["url_name"]
			@merchant_name  = dealhash["merchant"]["name"]
			@merchant_url_name  = dealhash["merchant"]["url_name"]
			@tags           = parse_tags(dealhash["tags"])
			@deal_image_highres = dealhash["deal_image_highres"]
			@hukd = hukd
			self
		end

		def parse_tags(hash)
			tags  = Array.new
			hash["items"].each do |tag|
				tags.push(tag['name'])
			end
			tags
		end



	end
end