class Train < ApplicationRecord
  has_many :train_stations
  has_many :stations, through: :train_stations

  validates :name, presence: true
  validates_uniqueness_of :name
end
