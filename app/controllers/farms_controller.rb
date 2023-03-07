class FarmsController < ApplicationController
  before_action :set_zone

  def show
  end

  def new
    @farm = @zone.farms.build
  end

  def create
    @farm = @zone.farms.build(farm_params)
    if @farm.save
      redirect_to zone_path(@zone), notice: "Finca creada exitosamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def states
    @states = CS.get(params[:country]).invert
    @target = params[:target]
    respond_to do |format|
      format.turbo_stream
    end
  end

  def cities
    @cities = CS.cities(params[:state])
    @target = params[:target]
    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def set_zone
    @zone = Zone.find(params[:zone_id])
  end

  def farm_params
    params.require(:farm).permit(
      :name,
      :latitude,
      :longitude,
      :country,
      :state,
      :city,
      :address
    )
  end
end
