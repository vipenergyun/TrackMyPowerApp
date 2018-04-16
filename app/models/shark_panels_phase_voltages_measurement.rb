class SharkPanelsPhaseVoltagesMeasurement < ApplicationRecord
	before_save :default_values
  protected
    def default_values
      self.voltage_a ||= 0
      self.voltage_b ||= 0
      self.voltage_c ||= 0
    end
end
