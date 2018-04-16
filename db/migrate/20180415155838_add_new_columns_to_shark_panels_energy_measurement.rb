class AddNewColumnsToSharkPanelsEnergyMeasurement < ActiveRecord::Migration[5.0]
  def change
    add_column :shark_panels_energy_measurements, :energy_watt2, :float
    add_column :shark_panels_energy_measurements, :energy_va2, :float
    add_column :shark_panels_energy_measurements, :energy_var2, :float
  end
end
