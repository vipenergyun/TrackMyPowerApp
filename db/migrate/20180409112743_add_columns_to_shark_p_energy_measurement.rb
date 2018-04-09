class AddColumnsToSharkPEnergyMeasurement < ActiveRecord::Migration[5.0]
  def change
    add_column :shark_p_energy_measurements, :watth, :float
    add_column :shark_p_energy_measurements, :vah, :float
    add_column :shark_p_energy_measurements, :varh, :float
  end
end
