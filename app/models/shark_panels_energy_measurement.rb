class SharkPanelsEnergyMeasurement < ApplicationRecord
	before_save :default_values
  protected
    def default_values
      self.energy_watt ||= 0
      self.energy_va ||= 0
      self.energy_var ||= 0
    end
end
