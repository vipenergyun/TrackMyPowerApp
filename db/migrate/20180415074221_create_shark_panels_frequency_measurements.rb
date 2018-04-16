class CreateSharkPanelsFrequencyMeasurements < ActiveRecord::Migration[5.0]
  def change
    create_table :shark_panels_frequency_measurements do |t|

      t.timestamps
    end
  end
end
