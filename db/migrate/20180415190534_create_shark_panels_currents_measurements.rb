class CreateSharkPanelsCurrentsMeasurements < ActiveRecord::Migration[5.0]
  def change
    create_table :shark_panels_currents_measurements do |t|

      t.timestamps
    end
  end
end
