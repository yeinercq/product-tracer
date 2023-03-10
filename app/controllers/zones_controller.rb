class ZonesController < ApplicationController
  before_action :set_zone, only: [:show, :edit, :update, :destroy]

  def index
    @zones = Zone.all.ordered
  end

  def show
    @farms = @zone.farms.ordered
  end

  def new
    @zone = Zone.new
  end

  def create
    @zone = Zone.new(zone_params)
    if @zone.save
      respond_to do |format|
        format.html { redirect_to zones_path, notice: "Nueva zona creada exitosamente." }
        format.turbo_stream { flash.now[:notice] = "Nueva zona creada exitosamente." }
      end
      # redirect_to zones_path, notice: "Nueva zona creada."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @zone.update(zone_params)
      respond_to do |format|
        format.html { redirect_to zones_path, notice: "Zona actualizada exitosamente." }
        format.turbo_stream { flash.now[:notice] = "Zona actualizada exitosamente." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @zone.destroy
      respond_to do |format|
        format.html { redirect_to zones_path, notice: "Zona eliminada exitosamente." }
        format.turbo_stream { flash.now[:notice] = "Zona eliminada exitosamente." }
      end
    end
  end

  private

  def set_zone
    @zone = Zone.find(params[:id])
  end

  def zone_params
    params.require(:zone).permit(:name)
  end
end
