class AddressesController < ApplicationController

  before_action :set_location
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @address = Address.new
  end

  def create
    @address = @location.create_address(address_params)
    @address.save ? (redirect_to trip_location_path(@location.trip_id, @location)) : (render :new)
  end

  def edit
  end

  def update
    @address.update(address_params) ? 
      (redirect_to location_address_path(@location, @address)) : (render :edit)    
  end

  def destroy
    @address.destroy
    redirect_to trip_location_path(@location.trip_id, @location)
  end

  def set_location
    @location = Location.find(params[:location_id])
  end

  def set_address
    @address = @location.address
  end

  def address_params
    params.require(:address).permit(:street_address, :city, :state, :zip)
  end


end
