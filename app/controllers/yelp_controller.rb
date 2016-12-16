class YelpController < ApplicationController

	def index
		@yelp_location = params[:location]
		#@yelp_params = params[:params]
		@yelp_results = Yelp.client.search(@yelp_location)
		render json: @yelp_results		
	end

end
