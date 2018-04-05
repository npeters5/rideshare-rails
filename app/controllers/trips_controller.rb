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
  end

  def destroy
  end
end
