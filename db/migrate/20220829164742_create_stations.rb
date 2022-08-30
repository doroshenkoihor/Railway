class CreateStations < ActiveRecord::Migration[6.0]
  def change
    create_table :stations do |t|
      t.string :name
      t.string :phone
      t.text :address
      t.text :info
      t.text :store_info

      t.timestamps
    end
  end
end
