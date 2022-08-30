class StationsController < ApplicationController
  before_action :require_authentication, except: %i[show index]
  before_action :set_station!, only: %i[show destroy edit update]
  before_action :fetch_trains, only: %i[show]

  def index
    @stations = Station.all
  end

  def new
    @station = Station.new
    set_blank_train_stations
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
    set_blank_train_stations
  end

  def destroy
    @station.destroy
    redirect_to stations_path
  end

  private

  def set_station!
    @station = Station.find_by id: params[:id]
  end

  def set_blank_train_stations
    3.times do
      train_station = @station.train_stations.build
      train_station.build_train
    end
  end

  def station_params
    params.require(:station).permit(
      :name,
      :phone,
      :address,
      :info,
      :store_info,
      train_stations_attributes: [
        :id,
        "arrival(4i)",
        "arrival(5i)",
        "departure(4i)",
        "departure(5i)",
        :_destroy,
        train_attributes: [:id, :name]
      ]
    )
  end

  def fetch_trains
    @trains = @station.trains.joins(:train_stations).order(:arrival).all
  end
end
