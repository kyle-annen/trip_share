class LocationsController < ApplicationController
   
  # in the location param on creation https://goo.gl/OOhEPc
  
  def new
    @location = Location.new
  end

  def create
    @trip = Trip.find(location_params[:trip_id])
    @location = Location.new(location_params)
    if @location.save
      redirect_to @trip, :"data-no-turbolink" => true
    else
      redirect_to @trip, :"data-no-turbolink" => true
    end

  end




  private
  def location_params
    params.require(:location).permit(:city, :lat, :long, :trip_id)
  end
end
