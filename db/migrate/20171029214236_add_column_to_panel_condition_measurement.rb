class AddColumnToPanelConditionMeasurement < ActiveRecord::Migration[5.0]
  def change
    add_column :panel_condition_measurements, :voltage_panel, :float
    add_column :panel_condition_measurements, :current_panel, :float
  end
end
