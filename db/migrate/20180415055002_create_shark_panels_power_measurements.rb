class CreateSharkPanelsPowerMeasurements < ActiveRecord::Migration[5.0]
  def change
    create_table :shark_panels_power_measurements do |t|

      t.timestamps
    end
  end
end
