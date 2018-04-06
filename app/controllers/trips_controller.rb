class TripsController < ApplicationController
  def index

  end

  def show
    @trip = Trip.find_by(id: params[:id])
  end

  def new
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

    #TODO: fix bug
    if @trip
      if @trip.update(trip_params)
        @trip.cost = params[:trip][:cost_in_dollar].to_i * 100
        if @trip.save
          redirect_to trip_path
        else
          render :edit
        end
      end
    end
  end

  def update_rating
    raise
    @trip = Trip.find_by(id: params[:id])
    @trip.rating = params[:rating]
    @trip.save
  end

  def destroy
    @trip = Trip.find_by(id: params[:id])

    if @trip
      @trip.destroy
    end
    #TODO: fix this
    flash[:notice] = "You successfully deleted this trip."
  end

  private

  def trip_params
    return params.require(:trip).permit(:date, :driver_id, :passenger_id, :rating, :cost)
  end
end
