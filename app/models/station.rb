class Station < ApplicationRecord
  has_many :train_stations
  has_many :trains, through: :train_stations
  accepts_nested_attributes_for :train_stations, allow_destroy: true, reject_if: :blank_train?

  validates :name, presence: true

  def blank_train?(attributes)
    attributes[:train_attributes][:name].blank? && attributes[:train_attributes][:id].nil?
  end
end
