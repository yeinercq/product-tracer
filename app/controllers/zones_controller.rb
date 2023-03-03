class ZonesController < ApplicationController
  before_action :set_zone, only: [:show, :edit, :update, :destroy]

  def index
    @zones = Zone.all
  end

  def show
  end

  def new
    @zone = Zone.new
  end

  def create
    @zone = Zone.new(zone_params)
    if @zone.save
      redirect_to zones_path, notice: "Nueva zona creada."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @zone.update(zone_params)
      redirect_to zones_path, notice: "Zona actualizada."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @zone.destroy
      redirect_to zones_path, notice: "Zona eliminada"
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
