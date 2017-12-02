class LocationsController < ApplicationController

  before_action :set_trip  
  before_action :set_location, only: [:show, :edit, :update, :destroy]    

  def index
    @locations = @trip.locations
  end

  def show
  end

  def new
    @location = @trip.location.new
  end

  def create
    @location = @trip.location.new(location_params)
    @location.save ? (redirect_to trip_locations_path(@trip)) : (redner :new)
  end

  def edit
  end

  def update
    @location.update(location_params) ? (redirect_to trip_location_path(@trip, @location)) : (render :edit)
  end

  def destroy
    @location.destroy
    redirect_to trip_path(@trip)
  end

  private

    def set_location
      @location = Trip.location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:name)
    end

    def set_trip
      @trip = Trip.find(params[:trip_id])
    end


end
