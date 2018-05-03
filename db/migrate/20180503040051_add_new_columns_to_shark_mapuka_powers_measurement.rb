class AddNewColumnsToSharkMapukaPowersMeasurement < ActiveRecord::Migration[5.0]
  def change
    add_column :shark_mapuka_powers_measurements, :power_watt_mpk, :float
    add_column :shark_mapuka_powers_measurements, :power_var_mpk, :float
    add_column :shark_mapuka_powers_measurements, :power_va_mpk, :float
  end
end
