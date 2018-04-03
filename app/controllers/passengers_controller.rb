class PassengersController < ApplicationController

  def index
    @passengers = Passenger.all.order("created_at DESC")
  end

  def show
  end

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(passenger_params)
    if @passenger.save
      redirect_to passengers_path
    else
      render :new
    end
  end

  def edit
    @passenger = Passenger.find_by(id: params[:id])
  end

  def update
    @passenger = Passenger.find_by(id: params[:id])

    if @passenger
      if @passenger.update(passenger_params)
        redirect_to passenger_path
      else
        render :edit
      end
    end
  end

  def destroy
  end

  private

  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end

end
