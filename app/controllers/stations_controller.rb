class StationsController < ApplicationController
  before_action :require_authentication, except: %i[show index]
  before_action :set_station!, only: %i[show destroy edit update]
  #after_action :verify_authorized, except: %i[show index]

  def index
    @stations = Station.all
  end

  def new
    @station = Station.new
  end

  def create
    @station = Station.new station_params

    if @station.save
      redirect_to stations_path
    else
      render new_station_path
    end
  end

  def update
    if @station.update station_params
      redirect_to stations_path
    else
      render stations_id_path
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @station.destroy
    redirect_to stations_path
  end

  private

  def authorize_station!
    authorize(@station || Station)
  end

  def set_station!
    @station = Station.find_by id: params[:id]
  end

  def station_params
    params.require(:station).permit(:name)
  end
end
