class TripsController < ApplicationController

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user_id = current_user.id
    if @trip.save
      redirect_to @trip
    else
      render 'new'
    end
  end

  def show
    @trip = Trip.find(params[:id])

    @trip_locations = Location.where(trip_id: params[:id])


    @new_location = Location.new
    @new_location.trip_id = @trip.id

  end

  def index
    @trips = Trip.where(user_id: current_user.id).paginate(
      :page => params[:page], :per_page => 12)
  end 

  private

  def trip_params
    params.require(:trip).permit(:name, :image, :blurb)
  end

  def location_params
    params.require(:location).permit(:city, :state_province, :country, :lat, :long, :arrival_date_time, :time_zone_id, :time_zone_name, :dst_offset, :raw_offset)
  end
end
