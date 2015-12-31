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
  end
  
  def index
    @trips = Trip.where(user_id: current_user.id).paginate(
      :page => params[:page], :per_page => 12)
  end 

    private

    def trip_params
      params.require(:trip).permit(:name, :image)
    end

    


  end
