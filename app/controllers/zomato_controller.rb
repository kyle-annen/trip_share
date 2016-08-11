class ZomatoController < ApplicationController

	def index
		if params[:api_type] == 'locations'
			query = Zomato.new
			query.getlocations(params[:query], params[:lat], params[:lon])
			render json: query.locations
		end
	end




	private
		def zomato_params
			params.require(:zomato).permit(:api_type, :query, :lat, :lon)
		end
end
