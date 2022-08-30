require 'rails_helper'

RSpec.describe "Stations", type: :request do
  let(:user) do
    Admin.create(
      name: 'Brad',
      email: 'Brad@email.com',
      password: '222',
      password_confirmation: '222'
    )
  end

  let(:station) do
    Station.create(
      name: 'Madrid',
      phone: '+45238459',
      address: 'Gran Via',
      info: 'Station in the city center',
      store_info: 'For every taste'
    )
  end

  let(:train) do
    Train.create(
      name: 'Intercity'
    )
  end

  let(:train_station) do
    TrainStation.create(
      station: station,
      train: train,
      arrival: Time.now,
      departure: Time.now + 1.hour
    )
  end

  let(:params) do
    { station: {
        id: station.id,
        name:'Barcelona',
        phone: '+45235326',
        address: 'La Rambla',
        info: 'Station near city center',
        store_info: 'Only water',
        train_stations_attributes: { '0' => {
                                       id: train_station.id,
                                       "arrival(4i)" => 4,
                                       "arrival(5i)" => 15,
                                       "departure(4i)" => 5,
                                       "departure(5i)" => 15,
                                       train_attributes: { id: train.id, name: 'East express' }
        } }
    } }
  end

  let(:create_params) do
    { station: {
        name:'Barcelona',
        phone: '+45235326',
        address: 'La Rambla',
        info: 'Station near city center',
        store_info: 'Only water',
        train_stations_attributes: { '0' => {
                                       "arrival(4i)" => 2,
                                       "arrival(5i)" => 11,
                                       "departure(4i)" => 4,
                                       "departure(5i)" => 11,
                                       train_attributes: { name: 'Rocket' }
        } }
    } }
  end

  before(:each) do
    allow_any_instance_of(ApplicationController).
      to receive(:current_user).and_return(user)
  end

  describe "POST /create" do
    it "should create new station" do
      post stations_path, params: create_params
      expect(response).to redirect_to(stations_path)
      new_station = Station.last
      expect(new_station.name).to eq 'Barcelona'
      expect(new_station.phone).to eq '+45235326'
      expect(new_station.train_stations.last.arrival.hour).to eq 2
      expect(new_station.trains.last.name).to eq 'Rocket'
    end
  end

  describe "PUT /update" do
    it "should update station" do
      put station_path(station), params: params
      update_station = station.reload
      expect(update_station.name).to eq 'Barcelona'
      expect(update_station.phone).to eq '+45235326'
      expect(update_station.train_stations.last.departure.hour).to eq 5
      expect(update_station.trains.last.name).to eq 'East express'
    end
  end

  describe "DELETE /destroy" do
    it "should destroy station" do
      delete station_path(station), params: params
    end
  end
end
