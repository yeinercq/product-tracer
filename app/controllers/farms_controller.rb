class FarmsController < ApplicationController
  before_action :set_zone
  before_action :set_farm, only: [ :show, :edit, :update, :destroy ]

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
    if @farm.update(farm_params)
      redirect_to zone_path(@zone), notice: "Finca editada exitosamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @farm.destroy
      redirect_to zone_path(@zone), notice: "Finca eliminada exitosamente."
    end
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

  def set_farm
    @farm = @zone.farms.find(params[:id])
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
