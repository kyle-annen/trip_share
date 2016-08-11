class Zomato
	#use HTTParty for simple http calls
	require 'httparty'
	#use HashDot to use dot syntax with hases
	require 'hash_dot'

	#assign the variable to be accessed through dot notation
	attr_accessor :locations, :locationdetails, :restaurants

	#initializes with default API key, one can be provided
	#headers and base uri should not change
	def initialize(apikey='f47a72ab00afe64aab78b9919ee3d427')
		@api_key = apikey
		@headers = {"Accept" => "application/JSON", "user-key" => @api_key}
		@base_uri = "https://developers.zomato.com/api/v2.1/"
	end

	#sets location guesses based on the query to @locations
	#query and latitude/longitude are required
	#hash returned can be viewd in Zomato documentation
	#https://developers.zomato.com/documentation#!/location/locations
	def getlocations(query='seattle', lat='47.6906021', lon='-122.3778869', count=100)		
		zomato_locations_url = @base_uri + 
			"/locations?query=#{query}&lat=#{lat}&lon=#{lon}&count=#{count}"
		response = HTTParty.get(zomato_locations_url, headers: @headers)
		if response.success?
			@locations = [];
			for result in response.parsed_response.location_suggestions
				@locations.push(result)
			end
		else
			raise response.response
		end
	end

	#Sets the locations details to @restaurants
	#Use the array index of @locations of the choosen location from the search
	# in order to return the location details for the chosen location.
	#Hash returned to @restaurants can be examined in Zomato documentation
	#https://developers.zomato.com/documentation#!/location/location_details
	def getlocationdetails(location_index=0)
		entity = @locations[location_index]
		entity_id = entity.entity_id
		entity_type = entity.entity_type
		zomato_location_details_url = @base_uri + 
			"/location_details?entity_id=#{entity_id}&entity_type=#{entity_type}"
		response = HTTParty.get(zomato_location_details_url, headers: @headers)
		if response.success?
			@restaurants = response.parsed_response
		else
			raise response.response
		end
		return @restaurants
	end



end