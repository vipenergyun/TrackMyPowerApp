class AddNewColumnsToSharkMapukaVariablesMeasurement < ActiveRecord::Migration[5.0]
  def change
    add_column :shark_mapuka_variables_measurements, :voltage_mpk, :float
    add_column :shark_mapuka_variables_measurements, :p_voltage, :float
    add_column :shark_mapuka_variables_measurements, :current_mpk, :float
    add_column :shark_mapuka_variables_measurements, :p_current, :float
    add_column :shark_mapuka_variables_measurements, :freq_mpk, :float
    add_column :shark_mapuka_variables_measurements, :pf_mpk, :float
  end
end
