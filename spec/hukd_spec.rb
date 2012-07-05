require "rspec"
require "hukd"

describe Hukd::Base do

	it "shouldn't work without an API key'" do
		expect { Hukd.new("").hottest('deals') }.to raise_error
	end

	it "should get hottest deals" do
		Hukd.new("YOUR_API_KEY_HERE").hottest('deals').count.should equal(20)
	end

	it "should get a custom number of deals" do
		Hukd.new("YOUR_API_KEY_HERE").hottest('deals','',10).count.should equal(10)
	end

	it "shouldn't get more than 500 deals" do
		Hukd.new("YOUR_API_KEY_HERE").hottest('deals','',10000).count.should equal(500)
	end

	it "should be able to specify a forum" do
		Hukd.new("YOUR_API_KEY_HERE").hottest('vouchers','',1)[0].forum_url_name.should == "vouchers"
	end

	it "should be able to specify a category" do
		Hukd.new("YOUR_API_KEY_HERE").hottest('','fashion',0)[0].category_url_name.should == "fashion"
	end

	it "should be able to specify a forum and category" do
		deal  = Hukd.new("YOUR_API_KEY_HERE").hottest('freebies','mobiles',1)[0]
		deal.forum_url_name.should == "freebies"
		deal.category_url_name.should == "mobiles"
	end

	it "should search by username" do
		Hukd.new("YOUR_API_KEY_HERE").user('wishihadadonkey','','',1)[0].poster_name.should ==  "wishihadadonkey"
	end

	it "should search by tag" do
		deal  = Hukd.new("YOUR_API_KEY_HERE").tag('xbox','deals','',1)[0].tags.should include('xbox')
	end

	it "should search by merchant" do
		Hukd.new("YOUR_API_KEY_HERE").merchant('itunes.apple.com','','',1)[0].merchant_url_name.should ==  "itunes.apple.com"
	end

	it "should search by keyword" do
		Hukd.new("YOUR_API_KEY_HERE").search('xbox','','',false,1,1)[0].title.should include("xbox")
	end

end