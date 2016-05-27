class StaticPagesController < ApplicationController
  def home
  	@trips = Trip.all.paginate(:page => params[:page], :per_page => 12)
  end

  def help
  end

  def about
  end
end
