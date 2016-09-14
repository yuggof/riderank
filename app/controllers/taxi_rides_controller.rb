class TaxiRidesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @taxi_ride = TaxiRide.new
    @taxi_providers = TaxiProvider.all
  end

  def create
    @taxi_ride = TaxiRide.new(create_params.merge(distance: 1)) # FIXME

    if @taxi_ride.save
      redirect_to action: :index
    else
      @taxi_providers = TaxiProvider.all

      render :new
    end
  end

  private

  def create_params
    params.fetch(:taxi_ride, {}).permit(
      :start_address, :destination_address,
      :fare, :taxi_provider_id
    )
  end
end
