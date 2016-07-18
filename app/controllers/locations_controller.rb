class LocationsController < ApplicationController
   
  # in the location param on creation https://goo.gl/OOhEPc
  
  def new
    @location = Location.new
  end

  def create
    @trip = Trip.find(location_params[:trip_id])
    @location = Location.new(location_params)
    if @location.save
      format.html { redirect_to @trip, :"data-no-turbolink" => true }
      format.js { render action: 'show', status: :created, location: @location}
    else
      redirect_to @trip, :"data-no-turbolink" => true
    end
  end


  def show
    @trip_locations = Location.where(trip_id: params[:id])
    render json: @trip_locations
  end

  




  private
    def location_params
      params.require(:location).permit(:city, :country, :state_province, :lat, :long, :trip_id)
    end
end
