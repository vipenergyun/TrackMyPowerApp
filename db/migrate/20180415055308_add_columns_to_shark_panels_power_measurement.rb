class AddColumnsToSharkPanelsPowerMeasurement < ActiveRecord::Migration[5.0]
  def change
    add_column :shark_panels_power_measurements, :power_watt, :float
    add_column :shark_panels_power_measurements, :power_va, :float
    add_column :shark_panels_power_measurements, :power_var, :float
  end
end
