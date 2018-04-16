class AddColumnsToSharkPanelsFrequencyMeasurement < ActiveRecord::Migration[5.0]
  def change
    add_column :shark_panels_frequency_measurements, :freqy, :float
    add_column :shark_panels_frequency_measurements, :pfactor, :float
  end
end
