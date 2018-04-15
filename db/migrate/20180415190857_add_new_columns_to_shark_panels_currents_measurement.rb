class AddNewColumnsToSharkPanelsCurrentsMeasurement < ActiveRecord::Migration[5.0]
  def change
    add_column :shark_panels_currents_measurements, :current_a, :float
    add_column :shark_panels_currents_measurements, :phase_a, :float
    add_column :shark_panels_currents_measurements, :current_b, :float
    add_column :shark_panels_currents_measurements, :phase_b, :float
    add_column :shark_panels_currents_measurements, :current_c, :float
    add_column :shark_panels_currents_measurements, :phase_c, :float
  end
end
