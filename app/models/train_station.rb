class TrainStation < ApplicationRecord
  belongs_to :station
  belongs_to :train
  accepts_nested_attributes_for :train
end
