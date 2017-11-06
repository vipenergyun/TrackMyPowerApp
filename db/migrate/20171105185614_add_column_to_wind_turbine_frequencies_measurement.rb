class AddColumnToWindTurbineFrequenciesMeasurement < ActiveRecord::Migration[5.0]
  def change
    add_column :wind_turbine_frequencies_measurements, :mag_y, :float
    add_column :wind_turbine_frequencies_measurements, :mag_z, :float
  end
end
