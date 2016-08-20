class TripsController < ApplicationController

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user_id = current_user.id
    if @trip.save
      render 'crop'
    else
      render 'new'
    end
  end

  def crop
    @trip = current_user.trips.last
  end

  def update
    @trip = current_user.trips.last
    if @trip.update_attributes(trip_params)
      redirect_to @trip, notice: 'Trip successfully created.'
    else
      render 'crop'
    end
  end

  def show
    @trip = Trip.find(params[:id])
    @trip_locations = Location.where(trip_id: params[:id]).as_json

    @trip_locations.each do |location|
      restaurants = Restaurant.where(location_id: location.id).as_json
      location[:restaurants] = restaurants
    end

    @new_location = Location.new
    @new_location.trip_id = @trip.id
    @new_restaurant = Restaurant.new
  end

  def index
    @trips = Trip.where(user_id: current_user.id).paginate(
      :page => params[:page], :per_page => 12)
  end 

  private

  def trip_params
    params.require(:trip).permit(:name, :image, :blurb, 
      :image_original_w, :image_original_h, :image_box_w, 
      :image_aspect, :image_crop_x, :image_crop_y, :image_crop_w, 
      :image_crop_h)
  end

  def location_params
    params.require(:location).permit(:city, :state_province, 
    :country, :lat, :long, :arrival_date_time, :time_zone_id, 
    :time_zone_name, :dst_offset, :raw_offset)
  end

  def restaurant_params
    params.require(:restaurant).permit(:res_id, :diners, :location_id)
  end

end
