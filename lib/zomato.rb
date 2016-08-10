class Zomato
	require 'httparty'
	require 'hash_dot'

	attr_accessor :api_key, :locations, :restraunts

	def initialize(apikey='f47a72ab00afe64aab78b9919ee3d427')
		@api_key = apikey
		@headers = {"Accept" => "application/JSON", "user-key" => @api_key}
		@base_uri = "https://developers.zomato.com/api/v2.1/"
	end

	def getlocations(query='seattle', lat='47.6906021', lon='-122.3778869', count=100)		
		zomato_locations_url = @base_uri + "/locations?query=#{query}&lat=#{lat}&lon=#{lon}&count=#{count}"
		response = HTTParty.get(zomato_locations_url, headers: @headers)
		if response.success?
			@locations = [];
			for result in response.parsed_response.location_suggestions
				@locations.push(result)
			end
			@locations
		else
			raise response.response
		end
	end

	def getlocationdetails(location_index=0)
		entity = @locations[location_index]
		entity_id = entity.entity_id
		entity_type = entity.entity_type
		zomato_location_details_url = @base_uri + "/location_details?entity_id=#{entity_id}&entity_type=#{entity_type}"
		response = HTTParty.get(zomato_location_details_url, headers: @headers)
		if response.success?
			@restraunts = response
		else
			raise response.response
		end
	end
end