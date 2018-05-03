class CreateSharkMapukaEnergiesMeasurements < ActiveRecord::Migration[5.0]
  def change
    create_table :shark_mapuka_energies_measurements do |t|

      t.timestamps
    end
  end
end
