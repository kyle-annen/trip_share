#use HTTParty for simple http calls
require 'httparty'
#use HashDot to use dot syntax with hases
require 'hash_dot'

class Zomato
	#assign the variable to be accessed through dot notation
	attr_accessor :locations, :location_details, :categories, :cities, 
	:collections, :cuisines, :establishments, :geocode, :daily_menu, 
	:reviews, :search

	#initializes with default API key, one can be provided
	#headers and base uri should not change
	def initialize(apikey='f47a72ab00afe64aab78b9919ee3d427')
		@api_key = apikey
		@headers = {"Accept" => "application/JSON", "user-key" => @api_key}
		@base_uri = "https://developers.zomato.com/api/v2.1/"
	end

	# COMMON Category
	# returns a list of categories (food categories)
	# https://developers.zomato.com/documentation#!/common/categories
	def get_categories()
		zomoato_categories_url = @base_uri + "categories"
		response = HTTParty.get(zomoato_categories_url, headers: @headers)
		if response.success?
			@categories = response.parsed_response
		else
			raise response.response
		end
		return @categories
	end

	# pass hash to get cities, valid key / value pairs below
	# q = ""seattle, lat = "", lon = "" , city_ids ="", count=50
	# {q: "seattle", lat: "", lon: "", city_ids: "", count=50 }
	def get_cities(options)
		url_base = @base_uri + "cities?" 

		a = options.key?(:q) ? "&q=#{options.q}" : ""
		b = options.key?(:lat) ? "&lat=#{options.lat}" : ""
		c = options.key?(:lon) ? "&lon=#{options.lon}" : ""
		d = options.key?(:city_ids) ? "&city_ids=#{options.city_ids}" : ""
		e = options.key?(:count) ? "&count=#{options.count}" : ""

		zomato_cities_url = url_base + a + b + c + d + e

		response = HTTParty.get(zomato_cities_url, headers: @headers)
		if response.success?
			@cities = response.parsed_response
		else
			raise response.response
		end
	end

	def get_collections(options)
		url_base = @base_uri + "collections?"

		a = options.key?(:city_id) ? "&city_id=#{options.city_id}" : ""
		b = options.key?(:lat) ? "&lat=#{options.lat}" : ""
		c = options.key?(:lon) ? "&lon=#{options.lon}" : ""
		d = options.key?(:count) ? "&count=#{options.count}" : ""

		zomato_collections_url = url_base + a + b + c + d

		response = HTTParty.get(zomato_collections_url, headers: @headers)
		if response.success?
			@collections = response.parsed_response
		else
			raise response.response
		end
	end

	# returns a hash of cuisines in a particular city or geographic location
	# accepts a hash: options. Required values either
	# {city_id: "279"}
	# or
	# {lat: 32.342, lon: 12.234}
	# utilizes string interpolation, any value will be interpolated to string and passed to the api endpoint
	# as an html argument
	def get_cuisines(options)
		url_base = @base_uri + "cuisines?"

		a = options.key?(:city_id) ? "&city_id=#{options.city_id}" : ""
		b = options.key?(:lat) ? "&lat=#{options.lat}" : ""
		c = options.key?(:lon) ? "&lon=#{options.lon}" : ""

		zomato_cuisines_url = url_base + a + b + c

		response = HTTParty.get(zomato_cuisines_url, headers: @headers)
		if response.success?
			@cuisines = response.parsed_response
		else
			raise response.response
		end
	end


	# returns a hash of establishment categories in a particular city or geographic location
	# accepts a hash: options. Required values either
	# {city_id: "279"}
	# or
	# {lat: 32.342, lon: 12.234}
	# utilizes string interpolation, any value will be interpolated to string and passed to the api endpoint
	# as an html argument
	def get_establishments(options)
		url_base = @base_uri + "establishments?"

		a = options.key?(:city_id) ? "&city_id=#{options.city_id}" : ""
		b = options.key?(:lat) ? "&lat=#{options.lat}" : ""
		c = options.key?(:lon) ? "&lon=#{options.lon}" : ""

		zomato_establishments_url = url_base + a + b + c

		response = HTTParty.get(zomato_establishments_url, headers: @headers)
		if response.success?
			@establishments = response.parsed_response
		else
			raise response.response
		end
	end

	#returns the information to a cooresponding geographical coordinate
	#accepts options hash
	#hash example
	#options: {lat: 24.5344, lon: -12.3423}
	def get_geocode(options)
		url_base = @base_uri + "geocode?"

		a = options.key?(:lat) ? "&lat=#{options.lat}" : ""
		b = options.key?(:lon) ? "&lon=#{options.lon}" : ""

		zomato_geocode_url = url_base + a + b

		response = HTTParty.get(zomato_geocode_url, headers: @headers)
		if response.success?
			@geocode = response.parsed_response
		else
			raise response.response
		end
	end

	#LOCATION

	# Sets the locations details to @location_details
	# https://developers.zomato.com/documentation#!/location/location_details
	def get_location_details(entity_id, entity_type)
		zomato_location_details_url = @base_uri + 
			"/location_details?entity_id=#{entity_id}&entity_type=#{entity_type}"
		response = HTTParty.get(zomato_location_details_url, headers: @headers)
		if response.success?
			@location_details = response.parsed_response
		else
			raise response.response
		end
	end

	#sets location guesses based on the query to @locations
	#query and latitude/longitude are required
	#hash returned can be viewed in Zomato documentation
	#https://developers.zomato.com/documentation#!/location/locations
	def get_locations(query='seattle', lat='47.6906021', lon='-122.3778869', count=100)		
		zomato_locations_url = @base_uri + 
			"/locations?query=#{query}&lat=#{lat}&lon=#{lon}&count=#{count}"
		response = HTTParty.get(zomato_locations_url, headers: @headers)
		if response.success?
			@locations = []
			for result in response.parsed_response.location_suggestions
				@locations.push(result)
			end
		else
			raise response.response
		end
	end

	


	#RESTAURANT
	def get_daily_menu(res_id)
		zomato_daily_menu_url = @base_uri +
			"/restaurant?res_id=#{res_id}"
		response = HTTParty.get(zomato_daily_menu_url, headers: @headers)
		if response.success?
			@daily_menu = response.parsed_response
		else
			raise response.response
		end
	end


	# get the details from the restaurant
	# https://developers.zomato.com/documentation#!/restaurant/restaurant_0
	def get_restaurant(res_id)
		zomato_restaurant_details_url = @base_uri +
			"/restaurant?res_id=#{res_id}"
		response = HTTParty.get(zomato_restaurant_details_url, headers: @headers)
		if response.success?
			@restaurant_details = response.parsed_response
		else
			raise response.response
		end
	end

	def get_reviews(options)
		url_base = @base_uri + "reviews?" 

		a = options.key?(:res_id) ? "&res_id=#{options.res_id}" : ""
		b = options.key?(:start) ? "&start=#{options.start}" : ""
		c = options.key?(:count) ? "&count=#{options.count}" : ""
		
		zomato_reviews_url = url_base + a + b + c

		response = HTTParty.get(zomato_reviews_url, headers: @headers)

		if response.success?
			@reviews = response.parsed_response
		else
			raise response.response
		end
	end




	def get_search(options)
		url_base = @base_uri + "search?"

		a = options.key?(:entity_id) ? "&entity_id=#{options.entity_id}" : ""
		b = options.key?(:entity_type) ? "&entity_type=#{options.entity_type}" : ""
		c = options.key?(:q) ? "&q=#{options.q}" : ""
		d = options.key?(:start) ? "&start=#{options.start}" : ""
		e = options.key?(:count) ? "&count=#{options.count}" : ""
		f = options.key?(:lat) ? "&lat=#{options.lat}" : ""
		g = options.key?(:lon) ? "&lon=#{options.lon}" : ""
		h = options.key?(:radius) ? "&radius=#{options.radius}" : ""
		i = options.key?(:cuisines) ? "&cuisines=#{options.cuisines}" : ""
		j = options.key?(:establishment_type) ? "&establishment_type=#{options.establishment_type}" : ""
		k = options.key?(:collection_id) ? "&collection_id=#{options.collection_id}" : ""
		l = options.key?(:category) ? "&category=#{options.category}" : ""
		m = options.key?(:sort) ? "&sort=#{options.sort}" : ""
		n = options.key?(:order) ? "&order=#{options.order}" : ""

		zomato_search_url = a + b + c + d + e + f + g + h + i + j + k + l + m + n

		response = HTTParty.get(zomato_search_url, headers: @headers)

		if response.success?
			@search = response.parsed_response
		else
			raise response.response
		end
	end
end