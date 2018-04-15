class AddNewColumnsToSharkPanelsPhaseVoltagesMeasurement < ActiveRecord::Migration[5.0]
  def change
    add_column :shark_panels_phase_voltages_measurements, :voltage_a, :float
    add_column :shark_panels_phase_voltages_measurements, :voltage_b, :float
    add_column :shark_panels_phase_voltages_measurements, :voltage_c, :float
  end
end
