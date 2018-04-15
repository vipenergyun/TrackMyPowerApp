class AddColumnsToSharkPanelsEnergyMeasurement < ActiveRecord::Migration[5.0]
  def change
    add_column :shark_panels_energy_measurements, :energy_watt, :float
    add_column :shark_panels_energy_measurements, :energy_va, :float
    add_column :shark_panels_energy_measurements, :energy_var, :float
  end
end
