class RestaurantsController < ApplicationController


	def new
		@restaurant = Restraunt.new
	end

	def create
		@trip = Trip.find(restaurant_params[:trip_id])
		@restaurant = Restaurant.new(restaurant_params)
		if @location.save
		  format.html { redirect_to @trip, :"data-no-turbolink" => true }
		  format.js { render action: 'show', status: :created, restaurant: @restaurant}
		else
		  redirect_to @trip, :"data-no-turbolink" => true
		end
	end

	private
	    def location_params
	      params.require(:restuarant).permit(:res_id, :diners, :location_id)
	    end
end



