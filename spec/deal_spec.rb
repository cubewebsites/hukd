require "rspec"
require "hukd"

describe Hukd::Deal do

	before(:all) do
		@deal = Hukd.new("API_KEY_HERE").hottest('deals','',1)[0]
	end

	it "should have a rounded temperature" do
		@deal.temperature_rounded.should be_an_integer
	end

end