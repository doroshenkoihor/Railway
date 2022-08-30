class CreateTrains < ActiveRecord::Migration[6.0]
  def change
    create_table :trains do |t|
      t.string :name, null: false, index: { unique: true }

      t.timestamps
    end

  end
end
