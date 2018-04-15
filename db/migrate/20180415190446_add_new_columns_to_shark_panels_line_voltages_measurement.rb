class AddNewColumnsToSharkPanelsLineVoltagesMeasurement < ActiveRecord::Migration[5.0]
  def change
    add_column :shark_panels_line_voltages_measurements, :voltage_ab, :float
    add_column :shark_panels_line_voltages_measurements, :phase_ab, :float
    add_column :shark_panels_line_voltages_measurements, :voltage_bc, :float
    add_column :shark_panels_line_voltages_measurements, :phase_bc, :float
    add_column :shark_panels_line_voltages_measurements, :voltage_ca, :float
    add_column :shark_panels_line_voltages_measurements, :phase_ca, :float
  end
end
