class TripsController < ApplicationController
  def index
  end

  def show
    @trip = Trip.find_by(id: params[:id])
  end

  def new
  end

  def create
  end

  def edit
    @trip = Trip.find_by(id: params[:id])
  end

  def update
    @trip = Trip.find_by(id: params[:id])

    #TODO: fix bug
    if @trip
      if @trip.update(trip_params)
        @trip.cost = params[:cost].to_i * 100
        redirect_to trip_path
      else
        render :edit
      end
    end

  end

  def destroy
  end

  private

  def trip_params
    return params.require(:trip).permit(:date, :driver_id, :passenger_id, :rating, :cost)
  end
end
