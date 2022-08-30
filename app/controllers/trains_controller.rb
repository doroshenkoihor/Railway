class TrainsController < ApplicationController
  before_action :set_train!, only: %i[show destroy edit update]
  before_action :fetch_stations, only: %i[new edit show]

  def index
    @trains = Train.all
  end

  def new
    @train = Train.new
  end

  def create
    @train = Train.new train_params

    if @train.save
      redirect_to trains_path
    else
      render new_train_path
    end
  end

  def edit
    @train_station = TrainStation.new
    @train = Train.all
  end

  def show
  end

  private

  def set_train!
    @train = Train.find_by id: params[:id]
  end

  def train_params
    params.require(:train).permit(:name)
  end

  def fetch_stations
    @stations = Station.all
  end
end
