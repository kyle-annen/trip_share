class LocationsController < ApplicationController
  
  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      respond_to do |format|
        format.html { redirect_to @trip, :"data-no-turbolink" => true }
        format.js { render action: 'show', status: :created, location: @location}
      end
    else
      redirect_to @trip, :"data-no-turbolink" => true
    end
  end

  def show
    @trip = Trip.find(params[:id]).as_json
    @trip_locations = Location.where(trip_id: params[:id]).as_json
    @trip_locations.each do |location|
      restaurants = Restaurant.where(location_id: location.id).as_json
      location[:restaurants] = restaurants
    end
    @trip[:trip_locations] = @trip_locations
    @trip[:image_url] = Trip.find(params[:id]).image.url(:medium)
    render json: @trip
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    head :no_content
    respond_to do |format|
      format.js
    end
  end

  private
    def location_params
      params.require(:location).permit(:city, :country, :state_province, :lat, :long, :trip_id)
    end
end
