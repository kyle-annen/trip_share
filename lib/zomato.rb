class ZomatoAPI
	require 'httparty'

	attr_accessor :apikey

	def initialize(apikey)
		@api_key = apikey
		@headers = {"Accept" => "application/JSON", "user-key" => @api_key}
	end

	def getlocations(query, lat, lon, count=100)		
		base_uri = "https://developers.zomato.com/api/v2.1/"
		zomatourl = base_uri + "/locations?&query=#{query}&lat=#{lat}&lon=#{lon}&count=#{count}"
		response = HTTParty.get(zomatourl, headers: @headers)
		if response.success?
			response
		else
			raise response.response
		end
	end
end