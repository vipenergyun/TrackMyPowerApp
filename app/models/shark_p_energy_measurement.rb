class SharkPEnergyMeasurement < ApplicationRecord
	before_save :default_values
	protected 
	def default_values
		self.watth ||= 0
		self.vah ||= 0
		self.varh ||= 0
	end 
end