class TripsController < ApplicationController

  before_action :set_trip, only: [:show, :edit, :update, :destroy]  

  def index
    @trips = Trip.all
  end

  def show
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.create(trip_params)
    @trip.save ? (redirect_to trips_path) : (render :new)
  end

  def edit
  end

  def update
    @trip.update(trip_params)       
    @trip.save ? (redirect_to trip_path(@trip)) : (render :edit)        
  end
  
  def destroy
    @trip.destroy
    redirect_to trips_path
  end

  private

    def trip_params
      params.require(:trip).permit(:name, :length)
    end

    def set_trip
      @trip = Trip.find(params[:id])
    end

end
