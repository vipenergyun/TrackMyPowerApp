class SharkPanelsPowerMeasurement < ApplicationRecord
  before_save :default_values
  protected
    def default_values
      self.power_watt ||= 0
      self.power_va ||= 0
      self.power_var ||= 0
    end
end
