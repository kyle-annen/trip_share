class RestaurantsController < ApplicationController


	def new
		@restaurant = Restraunt.new
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)
		if @restaurant.save
			respond_to do |format|
				format.html { redirect_to @trip, :"data-no-turbolink" => true }
				format.js { render action: 'show', status: :created, restaurant: @restaurant}
			end
		else
		 	redirect_to @trip, :"data-no-turbolink" => true
		end
	end

	def show
		@location_restaurants = Restaurant.where(location_id: params[:id])
		render json: @location_restaurants
	end

	private
	    def restaurant_params
	      params.require(:restaurant).permit(:res_id, :diners, :location_id)
	    end
end



