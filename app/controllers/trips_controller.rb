class TripsController < ApplicationController

  def new
    @trip = Trip.new
  end

  def create

    #get crop parameters from params as hash
    @cropparams = JSON.parse(trip_params[:crop_data])
    #get temp location of image from form (frontend)
    @tempimagepath = trip_params[:image].path()
    #get crop parameters as variables
    @x = @cropparams.x
    @y = @cropparams.y
    @width = @cropparams.width
    @height = @cropparams.height
    #create Minimagick item using temp file location
    @tripimage = MiniMagick::Image.open(@tempimagepath)
    #crop the Minimagick instance using parameters from front
    #end crop, using string interpolation.  Saved image will 
    #be further cropped by Paperclip, can be viewed in the
    #Trip model
    @tripimage.crop("#{@width}x#{@height}+#{@x}+#{@y}")
    #write the cropped image to the original, overwriting
    @tripimage.write(@tempimagepath)
    #pass all parameters to create trip
    @trip = Trip.new(trip_params)
    #set the trip user id to the current user id
    @trip.user_id = current_user.id
    #if parameters are validated, save and send to trip page with 
    #alert, else send back to the form
    if @trip.save
      redirect_to @trip, notice: 'Trip successfully created.'
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
      location[:restaurants] = restaurants.as_json
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
      :image_crop_h, :crop_data)
  end

  def location_params
    params.require(:location).permit(:city, :state_province, 
    :country, :lat, :long, :arrival_date_time, :time_zone_id, 
    :time_zone_name, :dst_offset, :raw_offset)
  end

  def restaurant_params
    params.require(:restaurant).permit(:res_id, :diners, :location_id, :api_type)
  end

end
