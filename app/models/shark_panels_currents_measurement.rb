class SharkPanelsCurrentsMeasurement < ApplicationRecord
	before_save :default_values
  protected
    def default_values
      self.current_a ||= 0
      self.phase_a ||=0
      self.current_b ||= 0
      self.phase_b ||=0
      self.current_c ||= 0
      self.phase_c ||=0
    end
end
