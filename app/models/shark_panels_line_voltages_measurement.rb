class SharkPanelsLineVoltagesMeasurement < ApplicationRecord
	before_save :default_values
  protected
    def default_values
      self.voltage_ab ||= 0
      self.phase_ab ||=0
      self.voltage_bc ||= 0
      self.phase_bc ||=0
      self.voltage_ca ||= 0
      self.phase_ca ||=0
    end
end
