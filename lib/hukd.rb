require "hukd/version"
require "httparty"

require File.join(File.expand_path(File.dirname(__FILE__)), 'hukd', 'base')
require File.join(File.expand_path(File.dirname(__FILE__)), 'hukd', 'deal')

module Hukd
	def self.new(apikey)
		Hukd::Base.new(apikey);
	end
end
