class CreateTrainStations < ActiveRecord::Migration[6.0]
  def change
    create_table :train_stations do |t|
      t.references :station, index: true
      t.references :train, index: true
      t.time :arrival
      t.time :departure

      t.timestamps
    end
  end
end
