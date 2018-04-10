class AddColumnsToSharkPFrequencyMeasurement < ActiveRecord::Migration[5.0]
  def change
    add_column :shark_p_frequency_measurements, :freqy, :float
    add_column :shark_p_frequency_measurements, :pfactor, :float
  end
end
