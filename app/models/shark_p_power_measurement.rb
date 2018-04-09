class SharkPPowerMeasurement < ApplicationRecord
	before_save :default_values
	protected 
	def default_values
		self.watt ||= 0
		self.va ||= 0
		self.var ||= 0
	end 
end