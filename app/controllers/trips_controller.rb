class TripsController < ApplicationController

  def show
    @trip = Trip.find_by(id: params[:id])
  end

  def create
    @trip = Trip.new
    @trip.date = DateTime.now
    @trip.cost = rand(9999)
    @trip.driver_id = Driver.all.where(is_available: true).sample.id
    @trip.passenger_id = Passenger.find_by(id: params[:passenger_id]).id
    if @trip.save
      redirect_to trip_path(@trip)
    else
      raise ArgumentError.new("Error: Trip not created.")
    end
  end

  def edit
    @trip = Trip.find_by(id: params[:id])
  end

  def update
    @trip = Trip.find_by(id: params[:id])

    if @trip
      if @trip.update(trip_params)
        if params[:trip][:cost_in_dollar]
          @trip.cost = params[:trip][:cost_in_dollar].to_i * 100
        end
        if @trip.save
          redirect_to trip_path
        else
          render :edit
        end
      end
    end
  end

  def destroy
    @trip = Trip.find_by(id: params[:id])

    if @trip
      @trip.destroy
      flash[:notice] = "You successfully deleted this trip."
    end
  end

  private

  def trip_params
    return params.require(:trip).permit(:date, :rating, :cost, :driver_id, :passenger_id)
  end
end
