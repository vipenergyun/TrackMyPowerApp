class AddNewColumnsToSharkMapukaEnergiesMeasurement < ActiveRecord::Migration[5.0]
  def change
    add_column :shark_mapuka_energies_measurements, :energy_watt_mpk, :float
    add_column :shark_mapuka_energies_measurements, :energy_var_mpk, :float
    add_column :shark_mapuka_energies_measurements, :energy_va_mpk, :float
  end
end
