class ZomatoController < ApplicationController

	def index
		if params[:api_type] == 'locations'
			@query = Zomato.new
			@query.get_locations(params[:query], params[:lat], params[:lon])
			render json: @query.locations
		elsif params[:api_type] == 'location_details'
			@loc_details = Zomato.new
			@loc_details.get_location_details(params[:entity_id], params[:entity_type])
			render json: @loc_details.location_details
		end
	end

	




	private
		def zomato_params
			params.require(:zomato).permit(:api_type, :query, :lat, :lon, :entity_id, :entity_type)
		end
end
