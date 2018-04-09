class AddColumnsToSharkPPowerMeasurement < ActiveRecord::Migration[5.0]
  def change
    add_column :shark_p_power_measurements, :watt, :float
    add_column :shark_p_power_measurements, :va, :float
    add_column :shark_p_power_measurements, :var, :float
  end
end
